class RemovePrefectureFromproducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :seller_prefecture, :integer
    remove_column :profiles, :prefecture, :integer
    remove_column :addressees, :prefecture, :integer
  end
end
