class RenameFavoritsToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_table :favorits, :favorites
  end
end
