class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.float :price
      t.float :weight
      t.float :amount

      t.timestamps null: false
    end
  end
end
