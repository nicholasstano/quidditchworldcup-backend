class RemoveSnitchCaughtFromPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :snitch_caught, :integer
  end
end
