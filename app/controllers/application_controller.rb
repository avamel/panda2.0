class ApplicationController < ActionController::Base
  before_filter [:set_locale, :set_currency]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def set_locale
    I18n.locale = :ru
    Time.zone = 'Europe/Minsk'
  end

  def set_currency
    @currency = CurrencyRate.last
  end
end
