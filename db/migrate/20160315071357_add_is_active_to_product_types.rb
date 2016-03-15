class AddIsActiveToProductTypes < ActiveRecord::Migration
  def change
    add_column :product_types, :is_active, :boolean, default: true
	  ProductType.reset_column_information
	  ProductType.update_all(is_active: true)
  end

end
