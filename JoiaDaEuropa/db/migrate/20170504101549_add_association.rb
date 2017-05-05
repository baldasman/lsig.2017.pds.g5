class AddAssociation < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :user, index: true
    add_reference :order, :order_status, index: true
    add_reference :order, :order_file, index: true
    add_reference :order, :reference, index: true
  end
end
