# override sign-up behaviour
class RegistrationsController < Devise::RegistrationsController

  before_action  :current_company

  helper_method :current_company

  layout 'admin'

  def edit
    super
  end

  def current_company
    @current_company ||= Company.includes(:market, :products, :work_types, :albums, :categories).find_by_custom_domain(request.host) || Company.includes(:market, :products, :work_types, :albums, :categories).find_by_sub_domain(current_subdomain)
    if @current_company
      theme = @current_company.layout.theme
      @current_company_layout = theme ? theme : @current_company.layout
    end
  end

  protected

  def after_update_path_for(resource)
    edit_user_registration_path
    #user_path(resource)
  end

end
