class AddUnitOfQuantityToProducts < ActiveRecord::Migration
  def change
    add_column :products, :unit_of_quantity, :string
  end
end
