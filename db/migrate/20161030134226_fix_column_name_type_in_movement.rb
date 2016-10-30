class FixColumnNameTypeInMovement < ActiveRecord::Migration[5.0]
  def change
    rename_column :movements, :type, :move_type
  end
end
