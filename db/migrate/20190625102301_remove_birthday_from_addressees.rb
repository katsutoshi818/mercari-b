class RemoveBirthdayFromAddressees < ActiveRecord::Migration[5.2]
  def change
    remove_column :addressees, :birthday
  end
end
