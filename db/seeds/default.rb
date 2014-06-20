puts '--- '
puts '--- CREATE MARKETS:'
puts '--- '
market = Market.find_or_create_by(name: $market_name)
market.address = $market_address
market.city = $market_city
market.save
puts market.inspect


puts '--- '
puts '--- CREATE COMPANY:'
puts '--- '
company = Company.find_or_create_by(market_id: market.id, name: $company_name, sub_domain: $company_sub_domain, contact_person: $company_contact_person, mobile_1: $company_mobile1, 
                                    mobile_2: $company_mobile1, phone_1: $company_phone1, custom_domain: $company_custom_domain)

company.logo = File.new("#{Rails.root}/db/seeds/assets/images/#{$company_logo.to_s}")
company.save
puts company.inspect 


puts '--- '
puts '--- CREATE COMPANY LAYOUT:'
puts '--- '
theme = CompanyLayout.find_by_theme_name($company_theme)
company_layout = CompanyLayout.new
company_layout.company_id = company.id
company_layout.company_layout_id = theme.id
company_layout.save(:validate => false)
puts company_layout.inspect

puts '--- '
puts '--- CREATE USER:'
puts '--- '
user1 = User.find_or_create_by!(email: $user_email) do |user|
  user.password = $user_password
  user.password_confirmation = $user_password
end
puts user1.inspect

puts '--- '
puts '--- CREATE COMPANY USER:'
puts '--- '
company_user1 = CompanyUser.find_or_create_by(company: company, user: user1)
puts company_user1.inspect


puts '--- '
puts '--- CREATE WORK TYPES:'
puts '--- '
$work_types.each do |work_type|
  o_work_type = WorkType.find_or_create_by(name: work_type, description: work_type)
  company_work_type = CompanyWorkType.find_or_create_by(work_type: o_work_type, company: company)  
  puts company_work_type.inspect
end


puts '--- '
puts '--- CREATE CATEGORY:'
puts '--- '
category = Category.find_or_create_by(name: $category_name)
puts category.inspect


puts '--- '
puts '--- CREATE PRODUCTS:'
puts '--- '
$products.each do |name, photo|
  product = Product.find_or_create_by(name: name, company_id: company.id, category_id: category.id, code: name)
  product.photo = File.new("#{Rails.root}/db/seeds/assets/images/#{photo.to_s}")
  product.save
  puts product.inspect
end

