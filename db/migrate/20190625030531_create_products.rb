class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :seller_user
      t.references :buyer_user
      t.references :brand
      t.references :category
      t.string :product_name, null: false
      t.text :introduction, null: false
      t.integer :product_size
      t.integer :product_state, null: false
      t.integer :who_pays_shipping_fee, null: false
      t.integer :seller_prefecture, null: false
      t.integer :days_to_ship, null: false
      t.integer :price, null: false
      t.integer :trade_state, null: false
      t.timestamps
    end
  end
end
