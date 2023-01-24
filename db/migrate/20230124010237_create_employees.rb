class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|

      t.timestamps
    end
  end
end
