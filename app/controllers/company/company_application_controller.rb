class Company::CompanyApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :company_subdomain
  helper_method :current_company  

  layout 'company'
  
  def current_company
    @current_company = Company.find_by_sub_domain(current_subdomain)
  end
  
  def company_subdomain
    if current_subdomain and current_company.nil?
        redirect_to company_not_found_path
    end
  end  

end