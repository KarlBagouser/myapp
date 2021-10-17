class AddAmountToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :amount, :integer
  end
end
