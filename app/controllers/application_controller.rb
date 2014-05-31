class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_company
  protect_from_forgery

  layout 'home'
  
  def current_company
    #@current_company = User.find_by_custom_domain(current_subdomain)
  end  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end
  
  private
  
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    admin_home_path
  end    

end
