class ClientAreaController < ApplicationController

  before_action :authenticate_user!

  def index
    @account = current_user
    @order = Order.all
  end

  def new_order
    @order = Order.new
  end

  def save_order
    @order = current_user.orders.build(orders_params)    # Not the final implementation!
    if @order.save
      flash[:success] = "Your order was submited successfully!"
      redirect_to
    else
      flash[:error] = "Something is wrong with your order. Please check your form."
      render 'home/index'
    end
  end

end
