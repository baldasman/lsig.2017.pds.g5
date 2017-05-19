class BackofficeController < ApplicationController

  before_filter :authorized?

  def index

    @account = current_user
    @orders = Order.all

    @pending_orders = Order.where(order_status_id: 1)
    @cancelled_orders = Order.where(order_status_id: 2)
    @concluded_orders = Order.where(order_status_id: 3)
    @approved_orders = Order.where(order_status_id: 4)

  end

  def check_order

    @order = Order.find_by(id: params[:order_id])

    @old_order = Order.find_by(id: @order.reference_id) if @order.reference_id
  end

  def save_order
    @order = Order.find_by(id: params[:order_id])
    @order.order_status_id = '2'
    @order.order_status_id = '3'
    @order.order_status_id = '4'

    if @order.save
      flash[:success] = 'Your order was successfully created!'
      redirect_to backoffice_index_path
    else
      flash[:error] = @order.errors.messages
      redirect_to backoffice_order_path
    end
    redirect_to backoffice_index_path
  end

  private

  def authorized?
    if current_user
      @accounts = User.where(id: current_user.id)
      @accounts.find_by(is_client: '0')
    end
  end

end
