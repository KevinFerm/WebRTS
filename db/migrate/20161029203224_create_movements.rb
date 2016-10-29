class CreateMovements < ActiveRecord::Migration[5.0]
  def change
    create_table :movements do |t|
      t.boolean :type, null: false, default: 0
      t.integer :bowmen, null: false, default: 0
      t.integer :swordsmen, null: false, default: 0
      t.integer :from_town, null: false, default: 0
      t.integer :to_town, null: false, default: 0
      t.integer :from, null: false
      t.integer :to, null: false
      t.integer :done_at, null: false, default: 0


      t.timestamps
    end
  end
end
