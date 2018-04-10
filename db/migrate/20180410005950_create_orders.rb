class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :table
      t.decimal :sub_total, precision: 15, scale: 2

      t.timestamps
    end
  end
end
