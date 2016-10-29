class CreateBuildings < ActiveRecord::Migration[5.0]
  def change
    create_table :buildings do |t|
      t.string :type, null: false, default: ""
      t.integer :amount, null: false, default: 0
      t.integer :done_at, null: false, default: 0
      t.integer :town_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
