class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def admin?
    current_user.role == 'admin'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :avatar
  end
end
