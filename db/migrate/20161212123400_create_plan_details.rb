class CreatePlanDetails < ActiveRecord::Migration
  def change
    create_table :plan_details do |t|
    	t.references :plan, index: true, foreign_key: true

    	t.string :detail

      t.timestamps null: false
    end
  end
end
