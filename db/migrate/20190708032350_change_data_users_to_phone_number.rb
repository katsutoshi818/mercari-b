class ChangeDataUsersToPhoneNumber < ActiveRecord::Migration[5.2]
  def change
    change_column :addressees, :postal_code, :string
    change_column :addressees, :phonenumber, :string
    change_column :users, :phone_number, :string
  end
end
