module Plan::Search
  extend ActiveSupport::Concern
  included do
    
    scope :with_start_or_finish_dates, lambda { |start_dates_str,finish_dates_str|
      start_dates_array = start_dates_str.split('/') if start_dates_str# 12/15/2016
      finish_dates_array = finish_dates_str.split('/') if finish_dates_str# 12/15/2016
      start_dates = Time.zone.parse(start_dates_array[2] + '-' + start_dates_array[0] + '-' + start_dates_array[1]) if start_dates_array
      finish_dates = Time.zone.parse(finish_dates_array[2] + '-' + finish_dates_array[0] + '-' + finish_dates_array[1]) if finish_dates_array
      table = PlanDate.arel_table
      condition = ( table[:start_dates].gteq(start_dates) && table[:finish_dates].lteq(finish_dates))
      where(condition)
    }

    scope :with_place, lambda {|place|
      table = PlanPlace.arel_table
      condition = table[:place].eq(place)
      where(condition)
    }

    scope :with_budget, lambda {|budget|
      table = PlanBudget.arel_table
      condition = table[:budget].lteq(budget)
      where(condition)
    }
    
    scope :with_plan_date, -> { joins(:plan_date) }
    scope :with_plan_place, -> {joins(:plan_place)}
    scope :with_plan_budget, -> {joins(:plan_budget)}

    scope :search, lambda {|search_params|
      r = self 
      r = 
        (r.with_plan_date.with_start_or_finish_dates(search_params[":start_dates"],search_params[":finish_dates"]) if (search_params[":start_dates"].present? || search_params[":finish_dates"].present?))||
        (r.with_plan_place.with_place(search_params[":plan_place"]) if search_params[":place"].present? )||
        (r.with_plan_budget.with_budget(search_params[":budget"]) if search_params[":budget"].present? )
      
      return r if r != self
      where({})
    }
  end
end