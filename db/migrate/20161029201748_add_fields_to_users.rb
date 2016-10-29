class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :coins, :integer, :null => false, :default => 10000
  end
end
