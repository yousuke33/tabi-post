class PlanNumOfCustomer < ActiveRecord::Base
	include Plan::BelongsTo
end
