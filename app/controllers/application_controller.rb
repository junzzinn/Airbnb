class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?, unless: :sign_up_page?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
  end

  def sign_up_page?
    params[:controller] == 'devise/registrations' && params[:action] == 'new'
  end
end
