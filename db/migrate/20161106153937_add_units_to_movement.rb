class AddUnitsToMovement < ActiveRecord::Migration[5.0]
  def change
    add_column :movements, :units, :string, :null => false, :default => "{}"
  end
end
