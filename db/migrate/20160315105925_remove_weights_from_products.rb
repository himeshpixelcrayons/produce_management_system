class RemoveWeightsFromProducts < ActiveRecord::Migration
  def change
  	remove_columns :products, :weight
  	add_column :products, :price, :float
  end
end
