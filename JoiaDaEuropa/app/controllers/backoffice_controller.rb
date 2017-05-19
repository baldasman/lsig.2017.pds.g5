class BackofficeController < ApplicationController

  before_filter :authorized?

  def index

    @account = current_user
    @orders = Order.all
    @search = params[:q]

    if @search.blank?
      @orders = Order.all
    else
      @orders = Order.where('description LIKE ?', "%#{@search}%")
    end

    @pending_orders = Order.where(order_status_id: 1)
    @cancelled_orders = Order.where(order_status_id: 2)
    @concluded_orders = Order.where(order_status_id: 3)
    @approved_orders = Order.where(order_status_id: 4)

  end

  def check_order

    @order = Order.find_by(id: params[:order_id])

    @old_order = Order.find_by(id: @order.reference_id) if @order.reference_id

  end

  def approve_order

    @order = Order.find_by(id: params[:order_id])
    @order.order_status_id = 4
    @order.save
    redirect_to backoffice_index_path

  end

  def cancel_order

    @order = Order.find_by(id: params[:order_id])
    @order.order_status_id = 2
    @order.save
    redirect_to backoffice_index_path

  end

  def conclude_order

    @order = Order.find_by(id: params[:order_id])
    @order.order_status_id = 3
    @order.save
    redirect_to backoffice_index_path

  end

  private

  def authorized?
    if current_user.is_client
      redirect_to client_area_index_path && return
    end
  end

end
