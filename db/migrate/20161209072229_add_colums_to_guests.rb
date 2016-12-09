class AddColumsToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :provider, :string
    add_column :guests, :uid, :string
    add_column :guests, :username, :string
  end
end
