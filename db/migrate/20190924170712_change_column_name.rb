class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :playoff_games, :compeleted, :completed
  end
end
