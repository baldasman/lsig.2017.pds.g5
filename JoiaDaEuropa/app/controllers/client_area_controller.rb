class ClientAreaController < ApplicationController

  before_action :authenticate_user!

  def index
    @account = current_user
    @order = Order.where(:order_statuses => :id)
  end

  def new_order

  end

  def save_order
    @order = order
  end

end
