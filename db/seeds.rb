# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

market1 = Market.find_or_create_by(name: "New Textile Market", description: "New Textile Market", address: 'Delhi gate', city: "Surat")
puts 'CREATED MARKETS:'

company1 = Company.find_or_create_by(market: market1, name: "Utsav Fashion", sub_domain: 'utsav')
puts 'CREATED COMPANIES:'

user1 = User.create(email: 'nitin.barai777@gmail.com', name: "Nitin Barai", password: 'nitin777', password_confirmation: 'nitin777')
puts 'CREATED USERS:'

company_user1 = CompanyUser.find_or_create_by(company: company1, user: user1)
puts 'CREATED COMPANY USERS:'