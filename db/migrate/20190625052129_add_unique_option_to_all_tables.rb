class AddUniqueOptionToAllTables < ActiveRecord::Migration[5.2]
  def change
    add_index :brands, :brand_name, unique: true
    add_index :categories, :category_name, unique: true
  end
end
