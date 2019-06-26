class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.references :category
      t.string :brand_name
      t.timestamps
    end
  end
end
