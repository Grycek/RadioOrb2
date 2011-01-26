class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  def authenticate_admin
      unless current_user and current_user.is_admin
          flash[:error] = "Permission denied"
          redirect_to root_path and return false
      else
          return true
      end
  end
  
  
  def set_locale
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    lang = extract_locale_from_accept_language_header
    lang = 'en' unless ['pl','en'].include? lang
    lang = 'en'
    I18n.locale = lang
    logger.debug "* Locale set to '#{I18n.locale}'"
  end
  private
  def extract_locale_from_accept_language_header
    if request.env['HTTP_ACCEPT_LANGUAGE'] != nil
      return request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    else
      return I18n.default_locale
    end
  end
  
end
