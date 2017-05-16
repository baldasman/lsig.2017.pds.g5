class PopulateOrderStatus < ActiveRecord::Migration[5.0]

    def up

        rename_column :order_statuses, :description, :internal_description

        OrderStatus.delete_all
        OrderStatus.create id: 1, internal_description: 'order_status.pending', created_at: Time.now, updated_at: Time.now
        OrderStatus.create id: 2, internal_description: 'order_status.cancelled', created_at: Time.now, updated_at: Time.now
        OrderStatus.create id: 3, internal_description: 'order_status.completed', created_at: Time.now, updated_at: Time.now

    end

    def down

        OrderStatus.delete(id: [1, 2, 3])

    end

end
