class AddWeightsToOrderItems < ActiveRecord::Migration
  def change
    add_column :products, :weight, :float
  end
end
