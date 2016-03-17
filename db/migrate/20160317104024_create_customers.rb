class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.text :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :landline
      t.string :cellphone
      t.string :email

      t.timestamps null: false
    end
  end
end
