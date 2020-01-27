class AddQuaffleShotsAgainstToPlayerGames < ActiveRecord::Migration[5.2]
  def change
    add_column :player_games, :quaffle_shots_against, :integer
  end
end
