class CreateWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :weeks do |t|
      t.string :name
      t.boolean :games_completed

      t.timestamps
    end
  end
end
