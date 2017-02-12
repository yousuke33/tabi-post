class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :title, null: false

      t.references :user, foreign_key: true 
      t.timestamps
    end
  end
end
