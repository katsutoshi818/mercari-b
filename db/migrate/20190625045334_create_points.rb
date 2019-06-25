class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.references :user
      t.integer :given_point
      t.string :remarks
      t.timestamps
    end
  end
end
