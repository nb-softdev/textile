class Company::HomeController < Company::CompanyApplicationController
  def index
    work_types_arr = @current_company.work_types.map{|work_type| work_type.name}
    @work_types = work_types_arr.join(", ")  
  end
  def company_admin_dashboard
    
  end
end
