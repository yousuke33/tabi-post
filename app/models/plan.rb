class Plan < ActiveRecord::Base
	after_initialize :prepare_plan
	has_one :plan_date, 		  	dependent: :destroy
	has_one :plan_place, 		  	dependent: :destroy
	has_one :plan_budget, 		  	dependent: :destroy
	has_one :plan_num_of_customer,  dependent: :destroy
	has_one :plan_detail, 		  	dependent: :destroy
	
	accepts_nested_attributes_for :plan_date
 	accepts_nested_attributes_for :plan_place
 	accepts_nested_attributes_for :plan_budget
	accepts_nested_attributes_for :plan_num_of_customer
	accepts_nested_attributes_for :plan_detail
	
	private
	def prepare_plan
		if new_record?
			self.plan_date =            PlanDate.new 
			self.plan_place =           PlanPlace.new 
			self.plan_budget =          PlanBudget.new 
			self.plan_num_of_customer = PlanNumOfCustomer.new 
			self.plan_detail =          PlanDetail.new 
		end
	end
end
