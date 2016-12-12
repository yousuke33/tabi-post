class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.references :user, index: true, foreign_key: true
      #日時の始まりと終わり
      #t.integer :start_dates
      #t.integer :finish_dates

      #t.integer :budget

      #t.integer :num_of_people

      #t.string :details

      t.timestamps null: false
    end
  end
end
