class AddCustomerNameToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :customer_name, :string
  end
end
