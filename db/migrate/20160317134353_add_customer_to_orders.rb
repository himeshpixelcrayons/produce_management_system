class AddCustomerToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :customer_id, :integer
    remove_column :orders, :customer_name
  end
end
