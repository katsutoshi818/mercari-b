class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.references :rater_user
      t.references :rated_user
      t.text :comment
      t.integer :rate, null: false
      t.timestamps
    end
  end
end
