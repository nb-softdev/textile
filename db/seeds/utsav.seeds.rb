puts "########################################"
puts 'Utsav'
puts "########################################"

#market details
$market_name =  "New Textile Market"
$market_address = 'Delhi gate'
$market_city = "Surat"


#company details
$company_name = "Utsav Fashion"
$company_description = "We are surat based ,a leading company in selling of sarees, dress material, yarn, fabrics, curtain & tapestry material etc"
$company_sub_domain = "utsav"
$company_custom_domain = ""
$company_contact_person = "Utsav Chandarana"
$company_mobile1 = "9913062857"
$company_mobile2 = "9825705693"

$what_i_do_label = "What We Do"
$who_i_am_label = "Who We Are"
$my_work_label = "Our Works"

$what_i_do_desc = "Best place to get the bulk dress materials here, provide discounts to our regular customers. We provide a Embroidered Silk Dress Materials, Fancy Dress Materials, Georgette Based Dress Material, Bandhani Dress Materials etc"
$who_i_am_desc = "We offer a wide collection of superior quality products at the most affordable rates. We employs the best technology and equipment, & follow latest quality and international standards."


#company theme
$company_theme = "blue_theme"

#user details
$user_email = 'utsav.chandarana@gmail.com'
$user_name = 'Utsav Chandarana'
$user_password = '********'

#work types details
$work_types = ["Dress Material Wholesalers", "Batik Print Dress Material Wholesalers", "Fancy Dress Materials Wholesalers", "Georgette Based Dress Material Wholesalers", "Bridal Wear Dress Materials Wholesalers"]


load File.join(Rails.root, 'db', 'seeds', 'default.rb')
