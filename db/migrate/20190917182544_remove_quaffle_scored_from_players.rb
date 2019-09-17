class RemoveQuaffleScoredFromPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :quaffle_scored, :integer
  end
end
