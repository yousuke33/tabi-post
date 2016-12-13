class PlansController < ApplicationController
	def new
		@plan = Plan.new
		
	end
	def create
		@plan = Plan.new(plan_params)
		if @plan.save
			redirect_to root_path
		else
			render 'plans/new'
		end
	end
		
	private

	def plan_params
		params.require(:plan).permit(
			plan_date_attributes: [:start_dates, :finish_dates],
			plan_place_attributes: [:coordinates],
			plan_num_of_people_attributes: [:num_of_people],
			plan_budget_attributes: [:budget],
			plan_detail: [:detail])
	end
end
