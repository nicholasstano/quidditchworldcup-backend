class ChangeColumnNameInPlayoffGames < ActiveRecord::Migration[5.2]
  def change
    rename_column :playoff_games, :week_id, :playoff_week_id
  end
end
