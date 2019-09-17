class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :wins
      t.integer :losses
      t.integer :points_for
      t.integer :points_against
      t.string :name
      t.string :flag
      t.string :division

      t.timestamps
    end
  end
end
