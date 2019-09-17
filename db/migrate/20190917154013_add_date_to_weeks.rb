class AddDateToWeeks < ActiveRecord::Migration[5.2]
  def change
    add_column :weeks, :date, :string
  end
end
