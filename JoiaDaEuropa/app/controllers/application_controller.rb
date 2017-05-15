class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :check_lang

  private

  def check_lang
    ##tod:change lang
  end
end
