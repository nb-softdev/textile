market = Market.find_or_create_by(name: $market_name)
puts market.inspect
market.address = $market_address
market.city = $market_city
market.save
puts 'CREATED MARKETS:'
puts '------------------------------------------'

company = Company.find_or_create_by(market_id: market.id, name: $company_name, sub_domain: $company_sub_domain, contact_person: $company_contact_person, mobile_1: $company_mobile1, 
                                    mobile_2: $company_mobile1, phone_1: $company_phone1, custom_domain: $company_custom_domain)
puts company.inspect 
company.logo = File.new("#{Rails.root}/db/seeds/assets/images/#{$company_logo.to_s}")
company.save
puts 'CREATED COMPANY:'
puts '------------------------------------------'

company_layout = CompanyLayout.find_or_create_by(company_id: company.id)
puts company_layout.inspect
puts 'CREATED COMPANY LAYOUT:'
puts '------------------------------------------'

user1 = User.find_or_create_by!(email: $user_email) do |user|
  user.password = $user_password
  user.password_confirmation = $user_password
end
puts user1.inspect
puts 'CREATED USER:'
puts '------------------------------------------'

company_user1 = CompanyUser.find_or_create_by(company: company, user: user1)
puts company_user1.inspect
puts 'CREATED COMPANY USER:'
puts '------------------------------------------'

$work_types.each do |work_type|
  o_work_type = WorkType.find_or_create_by(name: work_type, description: work_type)
  CompanyWorkType.find_or_create_by(work_type: o_work_type, company: company)  
end
puts 'CREATED WORK TYPES:'
puts '------------------------------------------'


category = Category.find_or_create_by(name: $category_name)
puts category.inspect
puts 'CREATED CATEGORY:'
puts '------------------------------------------'

$products.each do |name, photo|
  product = Product.find_or_create_by(name: name, company_id: company.id, category_id: category.id, code: name)
  puts product.inspect
  product.photo = File.new("#{Rails.root}/db/seeds/assets/images/#{photo.to_s}")
  product.save
end
puts 'CREATED PRODUCTS:'
puts '------------------------------------------'