class CreateVendorProducts < ActiveRecord::Migration
  def change
    create_table :vendor_products do |t|
      t.string :title
      t.float :price
      t.string :unit_of_quantity
      t.integer :vendor_id
      t.timestamps null: false
    end
  end
end
