class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.reference :user_id, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_katakana, null: false
      t.string :last_name_katakana, null: false
      t.integer :birthday, null: false
      t.integer :postal_code
      t.integer :prefecture
      t.string :city
      t.string :address
      t.string :building
      t.text :introduction
      t.string :avatar
      t.integer :point, null: false, default: 0
      t.timestamps
    end
  end
end
