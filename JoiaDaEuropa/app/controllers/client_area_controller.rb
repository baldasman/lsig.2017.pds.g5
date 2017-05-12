class ClientAreaController < ApplicationController
  def index
    @account = current_user
  end

  def new_order

  end

  def save_order
    @order = order
  end
end
