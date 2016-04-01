class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.text :street
      t.string :city
      t.string :state
      t.string :email
      t.string :zip
      t.string :country
      t.string :landline
      t.string :website
      t.timestamps null: false
    end
  end
end
