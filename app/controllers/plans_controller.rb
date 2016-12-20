class PlansController < ApplicationController
  def index
      params[:search] = {} if params[:search].blank?
      @users = User.all
    # if params[:start_dates]
    #   plan_dates = PlanDate.search(['start_dates'], [params[:start_dates]])
    #   plan_dates.each do |plan_date|
    #     @plan = Plan.search(['id'],[plan_date.plan_id])
    #   end
    # else
      @plans = Plan.all
      @plans = @plans.search(params[:search]) if parmas[:search].present?
    # end
    
    
    # search
    # render
  end

  def search
    @plans = Plan.search(parmas[:search])
    @users = User.all
    @plans = Plan.all
    result = []
    start_dates_result = PlanDate.where(start_dates:params[:start_dates])
    finish_dates_result = PlanDate.where(finish_dates:params[:finish_dates])

    #plan_id をresultに格納
    plan_id_arr(start_dates_result, result)
    plan_id_arr(finish_dates_result, result)

    @result = Hash.new { |h,k| h[k] = {} }
    result.each_with_index do |plan_id,index|
      plan = @plans.find_by(id: plan_id)
      user = @users.find_by(id: @plans.find_by(id: plan_id))
      

      # @result["user"+ index.to_s]["user_name"] = user.name 
      @result["user"+ index.to_s]["start_dates"] = plan.plan_date.start_dates
      @result["user"+ index.to_s]["finish_dates"] = plan.plan_date.finish_dates
    end

    @result = "nothing" if !@result

  end

  def new
    @plan =                      Plan.new
    @plan.plan_date =            PlanDate.new 
    @plan.plan_place =           PlanPlace.new 
    @plan.plan_budget =          PlanBudget.new 
    @plan.plan_num_of_customer = PlanNumOfCustomer.new 
    @plan.plan_detail =          PlanDetail.new 
  end

  def create
    if current_user.plan.create(plan_params) 
      flash[:success] = "投稿が完了しました"
      redirect_to root_path
    else
      render 'plans/new'
    end
  end

  def show
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

  def plan_id_arr(arr,result)
    arr.each do |f|
      result.append(f.plan_id) unless result.include?(f.plan_id)
    end
  end
end
