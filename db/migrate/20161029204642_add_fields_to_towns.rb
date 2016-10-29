class AddFieldsToTowns < ActiveRecord::Migration[5.0]
  def change
    add_column :towns, :swordsmen, :integer, :null => false, :default => 0
    add_column :towns, :bowmen, :integer, :null => false, :default => 0
  end
end
