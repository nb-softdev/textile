MARKET_NAME =  "New Textile Market"

market1 = Market.find_or_create_by(name: MARKET_NAME, description: MARKET_NAME, address: 'Delhi gate', city: "Surat")
puts 'CREATED MARKETS:'

company1 = Company.find_or_create_by(market: market1, name: "Demo Creation", sub_domain: 'utsav')
puts 'CREATED COMPANY:'

user1 = User.create(email: 'nitin.barai777@gmail.com', name: "Nitin Barai", password: 'nitin777', password_confirmation: 'nitin777')
puts 'CREATED USER:'

company_user1 = CompanyUser.find_or_create_by(company: company1, user: user1)
puts 'CREATED COMPANY USER:'