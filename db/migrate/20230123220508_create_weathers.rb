class CreateWeathers < ActiveRecord::Migration[7.0]
  def change
    create_table :weathers do |t|
      t.text :description
      t.text :measurements, default: [].to_yaml

      t.timestamps
    end
  end
end
