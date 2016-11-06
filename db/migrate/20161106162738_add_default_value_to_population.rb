class AddDefaultValueToPopulation < ActiveRecord::Migration[5.0]
  def change
    change_column :towns, :population, :string, :default => "{}"
  end
end
