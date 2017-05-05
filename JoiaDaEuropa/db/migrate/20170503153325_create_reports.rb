class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.belongs_to :user, index: true
      t.text :reason
      t.text :obs

      t.timestamps
    end
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.text :description
      t.datetime :order_date
      t.datetime :delivery_date
      t.decimal :total_value

      t.timestamps
    end
  end
end
