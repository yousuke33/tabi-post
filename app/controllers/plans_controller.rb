class PlansController < ApplicationController
  def index
  	@plans = Plan.all
    @greeting = params[:greeting]
    render
  end

  def new
    @plan = Plan.new
    @plan.plan_date =            PlanDate.new 
    @plan.plan_place =           PlanPlace.new 
    @plan.plan_budget =          PlanBudget.new 
    @plan.plan_num_of_customer = PlanNumOfCustomer.new 
    @plan.plan_detail =          PlanDetail.new 
  end

  def create
    if  plan = current_user.plan.create(plan_params) 
      flash[:success] = "投稿が完了しました"
      redirect_to root_path
    else
      render 'plans/new'
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
end
