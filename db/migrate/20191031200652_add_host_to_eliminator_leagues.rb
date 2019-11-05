class AddHostToEliminatorLeagues < ActiveRecord::Migration[5.2]
  def change
    add_column :eliminator_leagues, :host_id, :integer
  end
end
