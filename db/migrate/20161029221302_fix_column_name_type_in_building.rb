class FixColumnNameTypeInBuilding < ActiveRecord::Migration[5.0]
  def change
    rename_column :buildings, :type, :troop_type
  end
end
