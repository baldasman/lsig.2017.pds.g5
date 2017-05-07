class AddAssociation < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :user, index: true
    add_reference :orders, :order_status, index: true
    add_reference :orders, :order_file, index: true
    add_reference :orders, :reference, index: true
  end
end
