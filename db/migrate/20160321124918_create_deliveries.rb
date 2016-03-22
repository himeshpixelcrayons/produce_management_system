class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.integer :order_id
      t.date :date_delivered
      t.string :payment_type

      t.timestamps null: false
    end
  end
end
