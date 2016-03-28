class RemoveColumnOrderIdFromOrderItems < ActiveRecord::Migration
  def change
  	remove_column :order_items, :order_id
  end
end
