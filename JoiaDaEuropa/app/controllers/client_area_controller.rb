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

    def view_order
        @order = Order.find_by(id: params[:order_id])
    end

    def save_order

        # TODO: edit if id is present
        _order = params[:order]

        @order = Order.new user_id: current_user.id
        @order.description = _order[:description]
        @order.total_value = _order[:total_value]
        @order.delivery_date = _order[:delivery_date]
        @order.obs = _order[:obs]

        if @order.save
            flash[:success] = 'Your order was successfully created!'
            redirect_to client_area_index_path
        else
            flash[:error] = @order.errors.messages
            redirect_to client_area_new_order_path
        end

    end

end
