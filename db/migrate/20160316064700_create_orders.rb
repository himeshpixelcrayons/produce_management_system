class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.text :address
      t.integer :contact
      t.date :date
      t.float :amount_delivered
      t.timestamps null: false
    end
  end
end
