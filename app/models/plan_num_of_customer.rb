class PlanNumOfCustomer < ActiveRecord::Base
	include Plan::BelongsTo
	validates :number, presence: true
end
