class RemoveSnitchFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :snitch, :string
  end
end
