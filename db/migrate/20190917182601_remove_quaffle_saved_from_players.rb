class RemoveQuaffleSavedFromPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :quaffle_saved, :integer
  end
end
