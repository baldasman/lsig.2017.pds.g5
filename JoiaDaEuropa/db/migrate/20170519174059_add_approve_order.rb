class AddApproveOrder < ActiveRecord::Migration[5.0]

  def up

    _order = OrderStatus.find_or_initialize_by id: 4

    _order.update_attributes internal_description: 'order_status.approved', created_at: Time.now, updated_at: Time.now
    _order.save

  end

  def down

    OrderStatus.delete([4])

  end
end
