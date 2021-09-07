class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  def after_sign_up_path_for(resource)
    root_path
  end


  def after_sign_in_path_for(resource)
    if user_signed_in?
      root_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :user
      root_path
    else
      new_admin_session_path
    end
  end
  
  
end
