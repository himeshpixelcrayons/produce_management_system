class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.integer :quantity
      t.float :weight
      t.integer :product_type_id

      t.timestamps null: false
    end
  end
end
