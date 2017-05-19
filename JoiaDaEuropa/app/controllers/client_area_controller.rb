require 'securerandom'

class ClientAreaController < ApplicationController

    before_action :authenticate_user!

    def index

        @account = current_user
        @search = params[:q]

        if @search.blank?
            @orders = Order.all
        else
            @orders = Order.where('description LIKE ?', "%#{@search}%")
        end

        @pending_orders = Order.where(user_id: current_user.id, order_status_id: 1)
        @cancelled_orders = Order.where(user_id: current_user.id, order_status_id: 2)
        @completed_orders = Order.where(user_id: current_user.id, order_status_id: 3)
        @approved_orders = Order.where(user_id: current_user.id, order_status_id: 4)

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

        @order.description = _order[:description]
        @order.total_value = _order[:total_value]
        @order.delivery_date = _order[:delivery_date]
        @order.obs = _order[:obs]
        @order.reference_id = _order[:reference_id]


        # upload file
        _upload = _order[:file]
        _filename = SecureRandom.hex + '_' + _upload.original_filename

        @order.order_file = OrderFile.new path: _filename

        File.open(Rails.root.join('public', 'uploads', _filename), 'wb') do |file|
            file.write(_upload.read)
        end

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

    private

    def authorized?
        unless current_user.is_client
            redirect_to backoffice_index_path and return
        end
    end
end
