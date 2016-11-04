class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.string :name, null: false, default: ""
      t.integer :health, null: false, default: 0
      t.integer :armor, null:false, default: 0
      t.integer :max_hit, null:false, default: 0
      t.integer :min_hit, null:false, default: 0
      t.integer :attack, null:false, default: 0
      t.integer :speed, null:false, default: 0
      t.integer :defense, null:false, default: 0
      t.string :range, null:false, default: 0
      t.string :effects, null:false, default: 0
      t.timestamps
    end
  end
end
