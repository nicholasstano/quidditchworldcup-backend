class RemoveDateFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :date, :string
  end
end
