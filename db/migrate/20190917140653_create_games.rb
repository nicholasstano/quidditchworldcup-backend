class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :week_id
      t.integer :home_id
      t.integer :away_id
      t.integer :home_score
      t.integer :away_score
      t.string :date
      t.boolean :snitch
      t.boolean :completed

      t.timestamps
    end
  end
end
