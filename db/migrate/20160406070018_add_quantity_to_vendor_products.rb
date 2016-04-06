class AddQuantityToVendorProducts < ActiveRecord::Migration
  def change
    add_column :vendor_products, :quantity, :integer
  end
end
