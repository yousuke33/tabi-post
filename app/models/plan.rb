class Plan < ActiveRecord::Base
	include Plan::Search
	# after_initialize :prepare_plan
	has_one :plan_date, 		  	dependent: :destroy
	has_one :plan_place, 		  	dependent: :destroy
	has_one :plan_budget, 		  	dependent: :destroy
	has_one :plan_num_of_customer,  dependent: :destroy
	has_one :plan_detail, 		  	dependent: :destroy
	
	validates :plan_date, presence: true
	
	accepts_nested_attributes_for :plan_date
 	accepts_nested_attributes_for :plan_place
 	accepts_nested_attributes_for :plan_budget
	accepts_nested_attributes_for :plan_num_of_customer
	accepts_nested_attributes_for :plan_detail

	# scope :with, ->{joins(:plan_date,:plan_place,:plan_budget, :plan_num_of_customer,:plan_detail)}
	# scope :search_with_id, ->(id){where(id: id)}

	# scope :search, lambda {|search_keys, search_values|
	# 	conditions = nil
	# 	search_keys.each_with_index do |search_key, i|
	# 		if conditons.present?
	# 			conditions = conditions.and(arel_table[search_key].eq(search_values[i]))
	# 		else
	# 			conditions = arel_table[search_key].eq(search_values[i])
	# 		end
	# 	where(conditions)
	# }


	
	private

	# def timezone(plan_params)
	# 	start_dates_arr = plan_params[:start_dates].split("/")
	# 	finish_dates_arr = plan_params[:finish_dates].split("/")
	# 	start_dates = [ start_dates_arr[2] + - + start_dates_arr[0] + - + start_dates_arr[1] ]
	# 	finish_dates = [ finish_dates_arr[2] + - + finish_dates_arr[0] + - + finish_dates_arr[1] ]
	# 	plan_params[:start_dates] = Time.zone.parse(start_dates)
	# 	plan_params[:finish_dates] = Time.zone.parse(finish_dates)
	# end

	def self.prepare_plan
		if self.new_record?
			self.plan_date =            PlanDate.new 
			self.plan_place =           PlanPlace.new 
			self.plan_budget =          PlanBudget.new 
			self.plan_num_of_customer = PlanNumOfCustomer.new 
			self.plan_detail =          PlanDetail.new 
		end
	end
end
