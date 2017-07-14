class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception  
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def user_not_authorized
    if current_user.present?
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(root_path)
  	else	
  	  flash[:alert] = "You need to sign up to perform this action."
	  redirect_to(new_user_registration_path)
	end  
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
