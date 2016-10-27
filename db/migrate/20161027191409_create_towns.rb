class CreateTowns < ActiveRecord::Migration[5.0]
  def change
    create_table :towns do |t|
      t.integer :x
      t.integer :y
      t.integer :level
      t.string :population
      t.timestamps
    end
  end
end
