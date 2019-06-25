class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user
      t.references :product
      t.text :comment, null: false
      t.timestamps
    end
  end
end
