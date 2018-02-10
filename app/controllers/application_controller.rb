class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :not_find
  before_action :set_locale

  def default_url_options
    if I18n.default_locale == I18n.locale
      Rails.application.config.action_controller.default_url_options
    else
      Rails.application.config.action_controller.default_url_options.merge(lang: I18n.locale)
    end
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
