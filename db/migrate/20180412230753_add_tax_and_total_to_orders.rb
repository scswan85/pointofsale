class AddTaxAndTotalToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :tax, :decimal, precision: 15, scale: 2
    add_column :orders, :total, :decimal, precision: 15, scale: 2
  end
end
