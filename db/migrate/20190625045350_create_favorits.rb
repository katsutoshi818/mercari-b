class CreateFavorits < ActiveRecord::Migration[5.2]
  def change
    create_table :favorits do |t|
      t.references :user
      t.references :product
      t.timestamps
    end
  end
end
