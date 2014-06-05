#market details
@market_name =  "New Textile Market"
@market_address = 'Delhi gate'
@market_city = "Surat"


#company details
@company_name = "Utsav Fashion"
@company_sub_domain = "utsav"

#user details
@user_email = 'utsav@textile.com'
@user_name = 'Utsav'
@user_password = 'utsav777'

#work types details
@work_types = "Dress Material Wholesalers, Batik Print Dress Material Wholesalers, Printed Polyester Dress Material Manufacturers"



load File.join(Rails.root, 'db', 'seeds', 'default.rb')