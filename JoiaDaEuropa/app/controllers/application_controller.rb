class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :check_lang
  respond_to :html, :json

  private

  def check_lang

    if params[:lang].present?
      begin
        session[:lang] = params[:lang].to_sym
      rescue
        session[:lang] = nil
      end
    end

    _default_lang = extract_locale_from_accept_language_header.to_sym

    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    logger.debug "* Accepted Languages: #{Rails.configuration.i18n.available_locales}"

    if session[:lang].present?
      # Try session variable
      I18n.locale = session[:lang]

      logger.debug '* LANG from session'
    elsif I18n.available_locales.include? _default_lang
      # Try decoding from browser
      I18n.locale = _default_lang
      session[:lang] = _default_lang

      logger.debug '* LANG from browser'
    else
      # Fault back to PT
      I18n.locale = :pt
      session[:lang] = :pt

      logger.debug '* LANG from default'
    end

    logger.debug "* Locale set to '#{I18n.locale}'"
  end

  def extract_locale_from_accept_language_header

    _r = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first rescue ''
    return _r || ''

  end
end
