class AddIsDeliveredToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :is_delivered, :boolean, default: false
  end
end
