class CreateCashiers < ActiveRecord::Migration
  def change
    create_table :cashiers do |t|

      t.timestamps null: false
    end
  end
end
