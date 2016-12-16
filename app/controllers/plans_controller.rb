class PlansController < ApplicationController
	def new
		@plan = Plan.new
	end

	def create
		# plan_params = params.require(:plan)
		# date_params = params.require(:plan).require(:plan_date).permit(:start_dates,:finish_dates)
		# place_params = params.require(:plan).require(:plan_place).permit(:coordinates)
		# number_params = params.require(:plan).require(:plan_num_of_customer).permit(:number)
		# budget_params = params.require(:plan).require(:plan_budget).permit(:budget)
		# detail_params = params.require(:plan).require(:plan_detail).permit(:detail)


		# @plan_date = @plan.plan_date.create(date_params)
		# # @plan_date = PlanDate.create(date_params)
		# # @plan_date.plan_id = @plan.id

		# @plan_place = PlanPlace.create(place_params)
		# @plan_place.plan_id = @plan.id

		# @plan_number = PlanNumOfCustomer.create(number_params)
		# @plan_number.plan_id = @plan.id

		# @plan_budget = PlanBudget.create(budget_params)
		# @plan_budget.plan_id = @plan.id

		# @plan_detail = PlanDetail.create(detail_params)
		# @plan_detail.plan_id = @plan.id

		
		# @plan = current_user.plan.new
		@plan = current_user.plan.new(plan_params)
		if @plan.save  # && @plan_date.save && @plan_place.save&& @plan_number.save&& @plan_budget.save && @plan_detail.save   
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
			plan_place_attributes: [:coordinate],
			plan_num_of_customer_attributes: [:number],
			plan_budget_attributes: [:budget],
			plan_detail_attributes: [:detail])
	end
end
