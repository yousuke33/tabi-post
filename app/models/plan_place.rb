class PlanPlace < ActiveRecord::Base
	belongs_to :plan
	validates :place, presence: true
end
