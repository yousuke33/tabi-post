class CreatePlanPlaces < ActiveRecord::Migration
  def change
    create_table :plan_places do |t|
    	t.references :plan, index: true, foreign_key: true

    	t.string :place
    	
      t.timestamps null: false
    end
  end
end
