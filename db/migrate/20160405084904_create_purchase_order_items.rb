class CreatePurchaseOrderItems < ActiveRecord::Migration
  def change
    create_table :purchase_order_items do |t|
      t.integer :purchase_order_id
      t.integer :vendor_item_id
      t.integer :items_ordered
      t.integer :items_received
      t.float :items_rejected
      t.text :reject_reason

      t.timestamps null: false
    end
  end
end
