puts "########################################"
puts 'Utsav'
puts "########################################"

#market details
$market_name =  "New Textile Market"
$market_address = 'Delhi gate'
$market_city = "Surat"


#company details
$company_name = "Utsav Fashion"
$company_sub_domain = "utsav"
$company_custom_domain = ""
$company_logo = "logo.jpg"
$company_contact_person = "utsav"
$company_mobile1 = "9033194939"
$company_mobile2 = "9033194939"
$company_phone1 = "9033194939"

#user details
$user_email = 'utsav@email.com'
$user_name = 'Utsav'
$user_password = '12345678'

#work types details
$work_types = ["Dress Material Wholesalers", "Batik Print Dress Material Wholesalers", "Printed Polyester Dress Material Manufacturers"]

#category details
$category_name = "Velvet"

#products
$products = { "product1" => "product1.jpg", "product2" => "product2.jpg", "product3" => "product3.jpg", "product4" => "product4.jpg", "product5" => "product5.jpg", "product6" => "product6.jpg" }

load File.join(Rails.root, 'db', 'seeds', 'default.rb')