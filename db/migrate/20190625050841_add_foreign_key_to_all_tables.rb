class AddForeignKeyToAllTables < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :profiles, :users
    add_foreign_key :addressees, :users
    add_foreign_key :products, :users, column: :seller_user_id
    add_foreign_key :products, :users, column: :buyer_user_id
    add_foreign_key :products, :brands
    add_foreign_key :products, :categories
    add_foreign_key :comments, :users
    add_foreign_key :comments, :products
    add_foreign_key :rates, :users, column: :rater_user_id
    add_foreign_key :rates, :users, column: :rated_user_id
    add_foreign_key :points, :users
    add_foreign_key :favorits, :users
    add_foreign_key :favorits, :products
    add_foreign_key :brands, :categories
    add_foreign_key :product_images, :products
  end
end
