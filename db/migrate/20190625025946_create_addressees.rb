class CreateAddressees < ActiveRecord::Migration[5.2]
  def change
    create_table :addressees do |t|
      t.references :user
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_katakana, null: false
      t.string :last_name_katakana, null: false
      t.integer :birthday, null: false
      t.integer :postal_code, null: false
      t.integer :prefecture, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.integer :phonenumber
      t.timestamps
    end
  end
end
