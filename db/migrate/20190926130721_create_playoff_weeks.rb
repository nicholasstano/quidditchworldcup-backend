class CreatePlayoffWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :playoff_weeks do |t|
      t.string :name
      t.boolean :games_completed
      t.string :date

      t.timestamps
    end
  end
end
