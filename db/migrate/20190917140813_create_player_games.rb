class CreatePlayerGames < ActiveRecord::Migration[5.2]
  def change
    create_table :player_games do |t|
      t.integer :player_id
      t.integer :game_id
      t.integer :quaffle_scored
      t.integer :quaffle_saved
      t.integer :bludger_smashed
      t.integer :snitch_caught

      t.timestamps
    end
  end
end
