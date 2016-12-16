class CreatePlanNumOfCustomers < ActiveRecord::Migration
  def change
    create_table :plan_num_of_customers do |t|
    	t.references :plan, index: true, foreign_key: true

    	t.integer :number

      t.timestamps null: false
    end
  end
end
