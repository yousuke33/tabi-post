module Plan::Search
  extend ActiveSupport::Concern
  included do
    
    scope :with_start_dates, lambda { |start_dates_str|
      array = start_dates_str.split('/') # 12/15/2016
      puts array[2] + '-' + array[1] + '-' + array[0]
      start_dates = Time.zone.parse(array[2] + '-' + array[0] + '-' + array[1])
      table = PlanDate.arel_table
      condition = table[:start_dates].gteq(start_dates)
      where(condition)
    }
    
    scope :with_plan_date, -> { joins(:plan_date) }
    
    scope :search, lambda {|search_params|
      r = self
      r = r.with_plan_date.with_start_dates(search_params[:start_dates]) if search_params[:start_dates].present?
      return r if r != self
      where({})
    }
    #   scope :search, lambda { |keys, values| 
    #         conditions = nil
    #         # keys.each_with_index do |key, i|
    #         #   # if conditions.present?
    #         #   #   conditions = conditions.and(arel_table[key].eq(values[i]))
    #         #   # else
    #         #   #   conditions = arel_table[search_key].eq(search_values[i])
    #         #   # end 
    #         # end
        
    #     where(conditions)
    #   }
  end
end