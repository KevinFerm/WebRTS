class AddUserIdToTowns < ActiveRecord::Migration[5.0]
  def change
    add_column :towns, :user_id, :integer
  end
end
