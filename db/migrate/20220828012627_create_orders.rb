class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.string :total_amount, null: false
      t.integer :freight, null: false
      t.integer :payment_method, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
