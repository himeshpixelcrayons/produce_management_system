class DeleteColumnsOfOrders < ActiveRecord::Migration
  def change
  	remove_column :orders, :address
  	remove_column :orders, :contact
  	add_column :orders, :amount_received, :float
  end
end
