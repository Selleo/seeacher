class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  acts_as_token_authentication_handler_for User

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :provider
    devise_parameter_sanitizer.for(:sign_up) << :uid
  end
end
