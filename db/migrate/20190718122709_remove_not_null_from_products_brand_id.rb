class RemoveNotNullFromProductsBrandId < ActiveRecord::Migration[5.2]
  def change
    change_column_null :products, :brand_id, true
  end
end
