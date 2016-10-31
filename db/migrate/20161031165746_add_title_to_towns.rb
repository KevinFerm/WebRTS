class AddTitleToTowns < ActiveRecord::Migration[5.0]
  def change
    add_column :towns, :title, :string, :null => false, :default => "Town"
  end
end
