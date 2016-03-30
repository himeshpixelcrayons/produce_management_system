class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :delivery_id
      t.date :date

      t.timestamps null: false
    end
  end
end
