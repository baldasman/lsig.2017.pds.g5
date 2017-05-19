class ClientAreaController < ApplicationController

    before_action :authenticate_user!

    def index

        @account = current_user
        @orders = Order.all

        @pending_orders = Order.where(order_status_id: 1)
        @cancelled_orders = Order.where(order_status_id: 2)
        @completed_orders = Order.where(order_status_id: 3)
        @approved_orders = Order.where(order_status_id: 4)

    end

    def new_order

        @order = Order.new

        @old_orders = Order.where(user_id: current_user.id, order_status_id: [2])

    end

    def view_order

        @order = Order.find_by(id: params[:order_id])

        @old_order = Order.find_by(id: @order.reference_id) if @order.reference_id

    end

    def edit_order

        @order = Order.find_by(id: params[:order_id])

    end

    def save_order

        _order = params[:order]

        if _order[:id].to_i > 0
            @order = Order.find_by(id: _order[:id])
        else
            @order = Order.new user_id: current_user.id, order_status_id: 1
        end

        @order = Order.new user_id: current_user.id, order_status_id: 1
        @order.description = _order[:description]
        @order.total_value = _order[:total_value]
        @order.delivery_date = _order[:delivery_date]
        @order.obs = _order[:obs]
        @order.reference_id = _order[:reference_id]

        if @order.save
            flash[:success] = 'Your order was successfully created!'
            redirect_to client_area_index_path
        else
            flash[:error] = @order.errors.messages
            redirect_to client_area_new_order_path
        end


    end

    def destroy_order

        @order = Order.find_by(id: params[:order_id])
        @order.destroy

        redirect_to client_area_index_path

    end
end
