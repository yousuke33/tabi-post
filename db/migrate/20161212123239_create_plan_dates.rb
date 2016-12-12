class CreatePlanDates < ActiveRecord::Migration
  def change
    create_table :plan_dates do |t|
    	t.references :plan, index: true, foreign_key: true

    	t.integer :start_dates
    	t.integer :finish_dates

      t.timestamps null: false
    end
  end
end
