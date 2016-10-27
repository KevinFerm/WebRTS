class CreateAddUsernameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :permissions, :integer, :null => false, :default => 0
    add_column :users, :points, :integer
    add_column :users, :rank, :string
  end
end
