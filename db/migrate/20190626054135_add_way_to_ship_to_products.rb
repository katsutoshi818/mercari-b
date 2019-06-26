class AddWayToShipToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :way_to_ship, :integer, null: false
  end
end
