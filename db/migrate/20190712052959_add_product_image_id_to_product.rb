class AddProductImageIdToProduct < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :product_size, :product_size_id
  end
end
