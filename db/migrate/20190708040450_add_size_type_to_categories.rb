class AddSizeTypeToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :size_type, :integer
  end
end
