class CreatePlanBudgets < ActiveRecord::Migration
  def change
    create_table :plan_budgets do |t|

    	t.references :plan, index: true, foreign_key: true

    	t.integer :budget

      t.timestamps null: false
    end
  end
end
