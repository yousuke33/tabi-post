class PlanDetail < ActiveRecord::Base
	include Plan::BelongsTo
    validates :detail, presence: true
end
