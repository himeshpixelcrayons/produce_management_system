class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      t.date :date
      t.date :due_date
      t.boolean :is_outstanding
      t.integer :vendor_id
      t.timestamps null: false
    end
  end
end
