class CreateOrderStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :order_statuses do |t|
      t.belongs_to :order, index: true
      t.text :description

      t.timestamps
    end
  end
end
