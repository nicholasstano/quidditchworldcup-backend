class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :team_id
      t.integer :quaffle_scored
      t.integer :quaffle_saved
      t.integer :bludger_smashed
      t.integer :snitch_caught
      t.string :name
      t.string :position

      t.timestamps
    end
  end
end
