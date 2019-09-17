class RemoveBludgerSmashedFromPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :bludger_smashed, :integer
  end
end
