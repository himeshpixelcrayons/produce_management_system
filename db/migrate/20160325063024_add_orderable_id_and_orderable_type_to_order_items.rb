class AddOrderableIdAndOrderableTypeToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :orderable_id, :integer
    add_column :order_items, :orderable_type, :string
    OrderItem.reset_column_information
    OrderItem.all.each do |order_item|
    	order_item.update(orderable_id: order_item.order_id, orderable_type: "Order")
    end
  end
end
