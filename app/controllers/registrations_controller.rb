# override sign-up behaviour
class RegistrationsController < Devise::RegistrationsController

  helper_method :current_company

  layout 'admin'

  def edit
    super
  end

  def current_company
    @current_company = Company.includes(:market, :products).find_by_sub_domain(current_subdomain)
  end

  protected

  def after_update_path_for(resource)
    edit_user_registration_path
    #user_path(resource)
  end

end
