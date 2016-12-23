module Plan::Search
  extend ActiveSupport::Concern
  included do
    
    scope :with_start_or_finish_dates, lambda { |start_dates,finish_dates|
      table = PlanDate.arel_table
      if start_dates.present? && finish_dates.present?
        condition1 = table[:start_dates].gteq(start_dates)
        condition2 = table[:finish_dates].lteq(finish_dates)
        condition = condition1.and(condition2)
      elsif start_dates.present? && !finish_dates.present?
        condition = table[:start_dates].gteq(start_dates) 
      elsif !start_dates.present? && finish_dates.present?
        condition = table[:finish_dates].lteq(finish_dates) 
      end
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

    scope :with_num_of_customer, lambda {|number|
      table = PlanBudget.arel_table
      condition = table[:number].lteq(number)
      where(condition)
    }
    
    scope :with_plan_date, -> { joins(:plan_date) }
    scope :with_plan_place, -> {joins(:plan_place)}
    scope :with_plan_budget, -> {joins(:plan_budget)}
    scope :with_plan_number, -> {joins(:plan_num_of_customer)}

    scope :search, lambda {|search_params|
      r = self 
      r = (r.with_plan_date.with_start_or_finish_dates(search_params[":start_dates"],search_params[":finish_dates"]) if (search_params[":start_dates"].present? || search_params[":finish_dates"].present?)) ||
          (r.with_plan_place.with_place(search_params[":place"]) if search_params[":place"].present? )||
          (r.with_plan_budget.with_budget(search_params[":budget"]) if search_params[":budget"].present? ) ||
          (r.with_plan_number.with_num_of_customer(search_params[":number"]) if search_params[":number"].present? ) 
      
      return r if r != self
      where({})
    }
  end
end