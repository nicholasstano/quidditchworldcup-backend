class AddColumnToEliminatorLeagues < ActiveRecord::Migration[5.2]
  def change
    add_column :eliminator_leagues, :name, :string
  end
end
