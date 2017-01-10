class PlanBudget < ActiveRecord::Base
	include Plan::BelongsTo
	validates :budget, presence: true
end
