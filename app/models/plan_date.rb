class PlanDate < ActiveRecord::Base
	include Plan::BelongsTo
	validates :start_dates, presence: true
	validates :finish_dates, presence: true
end
