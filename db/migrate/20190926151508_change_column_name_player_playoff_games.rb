class ChangeColumnNamePlayerPlayoffGames < ActiveRecord::Migration[5.2]
  def change
    rename_column :player_playoff_games, :game_id, :playoff_game_id
  end
end
