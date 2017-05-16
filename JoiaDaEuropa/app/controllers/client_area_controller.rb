class ClientAreaController < ApplicationController

    before_action :authenticate_user!

    def index
        @account = current_user
        @orders = Order.all

        @pending_orders = Order.where(order_status_id: 1)
        @cancelled_orders = Order.where(order_status_id: 2)
        @completed_orders = Order.where(order_status_id: 3)




    end

    def new_order
        @order = Order.new
    end

    def save_order
        @order = current_user.orders.build(orders_params) # Not the final implementation!
        if @order.save
            flash[:success] = "Your order was submited successfully!"
            redirect_to client_area_index_path
        else
            flash[:error] = "Something is wrong with your order. Please check your form."
            render 'home/index'
        end
    end

end
