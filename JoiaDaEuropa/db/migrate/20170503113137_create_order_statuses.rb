class CreateOrderStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :order_statuses do |t|
      t.belongs_to :order, index: true
      t.text :description

      t.timestamps
    end
    create_table :order do |t|
      t.text :description
      t.datetime :order_date
      t.datetime :delivery_date
      t.decimal :total_value

      t.timestamps
    end
  end
end
