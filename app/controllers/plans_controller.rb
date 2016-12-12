class PlansController < ApplicationController
	def new
		@plan = Plan.new
		@plan.plan_date << PlanDate.new
		@plan.plan_place << PlanPlace.new
		@plan.plan_num_of_people << PlanNumOfPerson.new
		@plan.plan_budget << PlanBudget.new
		@plan.plan_detail << PlanDetail.new
	end
	
end
