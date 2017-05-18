class BackofficeController < ApplicationController

  before_filter :authorized?
  private
  def authorized?
    unless current_user.has_role? :admin
      flash[:error] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end

  def index

  end

  def check_order

  end
  
  def edit_order

  end

  def save_order

  end

end
