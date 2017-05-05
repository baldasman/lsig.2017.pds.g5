class CreateOrderFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :order_files do |t|
      t.belongs_to :user, index: true
      t.binary :type
      t.string :path
      t.text :obs

      t.timestamps
    end
  end
end
