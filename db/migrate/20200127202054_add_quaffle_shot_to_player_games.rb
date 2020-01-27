class AddQuaffleShotToPlayerGames < ActiveRecord::Migration[5.2]
  def change
    add_column :player_games, :quaffle_shots, :integer
  end
end
