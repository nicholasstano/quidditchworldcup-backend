class CreateEliminatorLeagueUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :eliminator_league_users do |t|
      t.integer :eliminator_league_id
      t.integer :user_id

      t.timestamps
    end
  end
end
