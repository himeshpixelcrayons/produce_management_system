class RenameColumnVendorItemsIdOfPurchaseOrderItems < ActiveRecord::Migration
  def change
  	rename_column :purchase_order_items, :vendor_item_id, :vendor_product_id
  end
end
