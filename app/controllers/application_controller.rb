class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :description, company_user_attributes: [:phone_number, :company_url]])
  end
  
  def after_sign_up_path_for(resource)
    root_path
  end
end
