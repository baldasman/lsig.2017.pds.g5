class ClientAreaController < ApplicationController

  before_action :authenticate_user!

  def index
    @account = current_user
    @order = Order.all
  end

  def new_order

  end

  def save_order
    @order = order
  end

end
