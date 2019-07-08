class ChangeDataUsersToPostalCode < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :postal_code, :string
  end
end
