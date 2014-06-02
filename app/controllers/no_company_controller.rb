class NoCompanyController < ApplicationController
  layout 'no_company'
  def company_not_found
    current_company = Company.find_by_sub_domain(current_subdomain)
    if current_company
      redirect_to root_path
    end
  end
end
