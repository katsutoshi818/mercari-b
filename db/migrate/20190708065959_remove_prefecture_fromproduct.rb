class RemovePrefectureFromproduct < ActiveRecord::Migration[5.2]
  def change
    add_column :addressees, :prefecture_id, :integer
    add_column :profiles, :prefecture_id, :integer
    add_column :products, :prefecture_id, :integer
  end
end
