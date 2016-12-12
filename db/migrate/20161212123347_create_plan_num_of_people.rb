class CreatePlanNumOfPeople < ActiveRecord::Migration
  def change
    create_table :plan_num_of_people do |t|

    	t.references :plan, index: true, foreign_key: true

    	t.integer :num_of_people

      t.timestamps null: false
    end
  end
end
