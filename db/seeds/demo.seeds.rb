#market details
@market_name =  "New Textile Market"
@market_address = 'Delhi gate'
@market_city = "Surat"


#company details
@company_name = "Demo Fashion"
@company_sub_domain = "demo"

#user details
@user_email = 'demo@textile.com'
@user_name = 'Demo'
@user_password = 'demo777'

#work types details
@work_types = "Dress Material Wholesalers, Batik Print Dress Material Wholesalers, Printed Polyester Dress Material Manufacturers"



load File.join(Rails.root, 'db', 'seeds', 'default.rb')