class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name, null: false
      t.string :address_zipcode, null: false, default: ""
  	  t.string :address_prefecture_name, null: false, default: ""
  	  t.string :address_city, null: false, default: ""
  	  t.string :address_street, null: false, default: ""

      t.timestamps null: false
    end
  end
end