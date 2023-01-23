class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.text :description
      t.decimal :lat, precision: 8, scale: 2
      t.decimal :lng, precision: 8, scale: 2
      t.references :weather, foreign_key: true, null: false

      t.timestamps
    end
  end
end
