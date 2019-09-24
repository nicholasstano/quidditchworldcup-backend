class CreatePlayoffGames < ActiveRecord::Migration[5.2]
  def change
    create_table :playoff_games do |t|
      t.integer :week_id
      t.integer :home_id
      t.integer :away_id
      t.integer :home_score
      t.integer :away_score
      t.boolean :compeleted

      t.timestamps
    end
  end
end
