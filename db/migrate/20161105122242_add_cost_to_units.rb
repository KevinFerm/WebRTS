class AddCostToUnits < ActiveRecord::Migration[5.0]
  def change
    add_column :units, :cost, :integer, :null => false, :default => 10
    add_column :buildings, :unit, :integer, :null => false, :default => 0
  end
end
