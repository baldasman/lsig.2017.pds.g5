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

        # TODO: edit if id is present

        @order = Order.new user_id: current_user.id
        @order.description = params[:order][:description]

        if @order.save
            flash[:success] = "Your order was submited successfully!"
            redirect_to client_area_index_path
        else
            flash[:error] = @order.errors.messages
            redirect_to client_area_new_order_path
        end

    end

end
