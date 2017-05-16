class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :check_lang
  respond_to :html, :json

  private

  def check_lang
    ##tod:change lang
  end
end
