class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.text :description
      t.datetime :order_date
      t.datetime :delivery_date
      t.decimal :total_value

      t.timestamps
      end
    add_reference :orders, references: :orders, foreign_key: true
  end
end
