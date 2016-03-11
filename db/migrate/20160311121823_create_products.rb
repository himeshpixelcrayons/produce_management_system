class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :product_type_id
      t.integer :quantity
      t.integer :weight
      t.float :amount

      t.timestamps null: false
    end
  end
end
