class Company::Admin::CompanyAdminApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  PER_PAGE = 10
  
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
  
  helper_method :sort_column, :sort_direction
  
  before_action :company_subdomain
  helper_method :current_company, :company_address, :company_mobiles, :company_phones

  layout 'admin'
  
  def current_company
    @current_company = Company.includes(:market, :products).find_by_sub_domain(current_subdomain)
  end
  
  def company_address
    cmp_add = []
    cmp_add << @current_company.address
    if @current_company.market
      cmp_add << @current_company.market.name
      cmp_add << @current_company.market.area
      cmp_add << @current_company.market.city
      cmp_add << @current_company.market.pincode
    end
    cmp_add.delete_if(&:blank?).join(', ')
  end
  
  def company_mobiles
    cmp_mobiles = []
    cmp_mobiles << @current_company.mobile_1 << @current_company.mobile_2 << @current_company.mobile_3
    cmp_mobiles.delete_if(&:blank?).join(', ')    
  end
  
  def company_phones
    cmp_phones = []
    cmp_phones << @current_company.phone_1 << @current_company.phone_2 << @current_company.phone_3
    cmp_phones.delete_if(&:blank?).join(', ')
  end  
  
  def company_subdomain
    if current_subdomain and current_company.nil?
        redirect_to company_not_found_path
    end
  end  
  
  def sort_column(sort='')
    controller_name.classify.constantize.column_names.include?(sort) ? sort : "id"
  end

  def sort_direction(direction='')
    %w[asc desc].include?(direction) ? direction : "desc"
  end  

end