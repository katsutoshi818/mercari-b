class CreateProductSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :product_sizes do |t|
      t.text :size_text
      t.integer :size_type
      t.timestamps
    end
  end
end
