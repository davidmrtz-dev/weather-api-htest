class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|

      t.timestamps
    end
  end
end
