class RemoveUniqueFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_index :categories, :category_name
  end
end
