class PlansController < ApplicationController
  def index
    if user_signed_in?
      if current_user.role == "owner"
        params[:search] = {} if params[:search].blank?
        @plans = Plan.search(params["search"]) if params["search"].present?
        if @plans
          flash[:success] = "#{@plans.length}件のプランが見つかりました"
        end
      else
        flash[:alert] = "オーナーとしてログインしてください"
        redirect_to root_path
      end
    else
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end 
  end

  def new
    if user_signed_in?
      if current_user.role == "guest"
         new_plan
      else
        flash[:alert] = "ゲストとしてログインしてください"
        redirect_to root_path
      end
    else
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end

  def create
    if current_user.plan.create(plan_params) 
      flash[:success] = "投稿が完了しました"
      redirect_to root_path
    else
      render 'plans/new'
    end
  end
  
  def edit
    @plan = Plan.find(params[:id])
    @user = User.find(@plan.user_id)
    unless current_user == @user
      flash[:danger] = "このプランの投稿者以外は編集できません。"
      redirect_to @user
    end
  end  

  def update
    @plan = Plan.find(params[:id])
    @user = User.find(@plan.user_id)
    if @plan.update(plan_params)
      flash[:success] = "編集が完了しました。"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  private

  def plan_params
    params.require(:plan).permit(
      plan_date_attributes: [:start_dates, :finish_dates],
      plan_place_attributes: [:place],
      plan_num_of_customer_attributes: [:number],
      plan_budget_attributes: [:budget],
      plan_detail_attributes: [:detail])
  end

  def new_plan
    @plan =                      Plan.new
    @plan.plan_date =            PlanDate.new 
    @plan.plan_place =           PlanPlace.new 
    @plan.plan_budget =          PlanBudget.new 
    @plan.plan_num_of_customer = PlanNumOfCustomer.new 
    @plan.plan_detail =          PlanDetail.new
  end
end
