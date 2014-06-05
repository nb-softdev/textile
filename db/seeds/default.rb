market = Market.find_or_create_by(name: @market_name)
market.address = @market_address
market.city = @market_city
market.save
puts 'CREATED MARKETS:'

company = Company.find_or_create_by(market: market, name: @company_name, sub_domain: @company_sub_domain)
puts 'CREATED COMPANY:'

user1 = User.create(email: @user_email, name: @user_name, password: @user_password, password_confirmation: @user_password)
puts 'CREATED USER:'

company_user1 = CompanyUser.find_or_create_by(company: company, user: user1)
puts 'CREATED COMPANY USER:'

@work_types.to_s.split(",").each do |work_type|
  o_work_type = WorkType.find_or_create_by(name: work_type, description: work_type)
  CompanyWorkType.find_or_create_by(work_type: o_work_type, company: company)  
end
puts 'CREATED WORK TYPES:'