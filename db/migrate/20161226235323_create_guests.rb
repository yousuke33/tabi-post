class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name, null: false

      t.timestamps null:false
    end
  end
end