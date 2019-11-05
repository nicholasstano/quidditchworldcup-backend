class CreateEliminatorLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :eliminator_leagues do |t|

      t.timestamps
    end
  end
end
