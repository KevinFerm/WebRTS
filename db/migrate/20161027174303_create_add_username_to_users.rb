class CreateAddUsernameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :permissions, :integer
    add_column :users, :points, :integer
    add_column :users, :rank, :string
  end
end
