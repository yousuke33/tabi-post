class PlanDate < ActiveRecord::Base
	include Plan::BelongsTo

	scope :search, lambda { |search_keys, search_values| 

    conditions = nil
    search_keys.each_with_index do |search_key, i|
      if conditions.present?
        conditions = conditions.and(arel_table[search_key].eq(search_values[i]))
      else
        conditions = arel_table[search_key].eq(search_values[i])
      end 
    end

    where(conditions)
  }
end
