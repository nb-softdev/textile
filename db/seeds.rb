# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

work_types = ["Dress Material Wholesalers", "Salwar Suits Manufacturers",
  "Embroidered Silk Dress Materials Wholesalers", "Fancy Dress Materials Wholesalers", "Georgette Based Dress Material Wholesalers",
  "Silver Circle Dress Material Manufacturers", "Bandhani Dress Materials Wholesalers", "Batik Print Dress Material Wholesalers", "Bridal Wear Dress Materials Wholesalers", 
  "Cotton Dress Material Wholesalers", "Lehenga Sarees Wholesalers", "Lezar Work Sarees Wholesalers", "Tissue Saree Manufacturers",
  "Printed Polyester Dress Material Manufacturers", "Salwar Suits with Jacquard Dupatta Manufacturers", "Simple Embroidery Dress Material Wholesalers",
  "Thread Embroidered Dress Material Wholesalers", "Unstitched Ladies Cotton Dress Material Wholesalers", "Woolen Suits with Shawl Wholesalers",
  "Floral Print Crepe Dress Material Wholesalers", "Poly Cotton Suits & Dress Materials Wholesalers", "Printed Polyester Dress Material Wholesalers",
  "Printed Salwar Suits Wholesalers"]
work_types.each do |work_type|
  WorkType.find_or_create_by(name: work_type, description: work_type, is_default: true)
end
puts 'CREATED WORK TYPES:'

categories = {
  "Sarees" => ["Bollywood Replica Sarees", "Bridal Sarees", "Bridal Heavy Saree", "Casual Sarees", "Chiffon Sarees"],
  "Salwar Kameez" => ["Ladies Salwar Kameez", "Ladies Salwar Suits", "Net Anarkali Suits", "Net Salwar Kameez", "Patiala Salwar Kameez"],
  "Dress Materials" => ["Silk Dress Material", "Printed Dress Materials", "Floral Printed Dress Material", "Bridal Dress Materials", "Bridal Wedding Dress Materials"],
  "Kurtis" => ["Chikan Kurtis", "Black Print Short Kurti", "Cotton Kurtis", "Cotton Printed Kurtis", "Cotton Silk Kurti"],
  "Fabrics" => ["Pashmina", "Orient", "Net", "Velvet", "Tussar Silk"],
  "Women Wear" => ["Suits", "Kaftan", "Top", "Capri", "Tunic"],
  "Mens Wear" => ["Brand Suits", "Duffle Coat", "Embroidered Sherwani", "Gents Kurta", "Gents Trousers"],
  "Children Clothing" => ["Baby Booties", "Baby Diapers", "Baby Napkin", "Boys Pants", "Boys Pyjama"]
  }
categories.each do |parent, child|
  parent_category = Category.find_or_create_by(name: parent)
  child.each do |child_category|
    Category.find_or_create_by(name: child_category, category_id: parent_category.id)
  end
end
puts 'CREATED CATEGORIES:'

CompanyLayout.find_or_create_by_theme_name(
theme_name: "Blue Theme", header_background_color: "#0099cc", header_text_background_color: "#ccffcc", home_background_color: "#ccffcc", 
what_i_do_background_color: "#ccffcc", who_i_am_background_color: "#ccffcc", my_work_background_color: "#ccffcc", album_background_color: "#ccffcc", 
album_sidebar_background_color: "#0099cc", contact_us_background_color: "#ccffcc", footer_background_color: "#66ccff", logo_font_color: "#66CCFF", 
header_font_color: "#0099cc", home_name_font_color: "#003399", home_description_font_color: "#0099cc", what_i_do_name_font_color: "#003399", 
what_i_do_description_font_color: "#0099cc", who_i_am_name_font_color: "#003399", who_i_am_description_font_color: "#0099cc", 
album_name_font_color: "#003399", album_description_font_color: "#66ccff", my_work_name_font_color: "#003399", my_work_description_font_color: "#0099cc", 
contact_us_name_font_color: "#003399", contact_us_description_font_color: "#66ccff", footer_font_color: "#003399", header_font: "normal", 
home_name_font: "normal", home_description_font: "italic", what_i_do_name_font: "normal", what_i_do_description_font: "italic", 
who_i_am_name_font: "normal", who_i_am_description_font: "italic", album_name_font: "normal", album_description_font: "italic", 
my_work_name_font: "normal", my_work_description_font: "italic", contact_us_name_font: "normal", contact_us_description_font: "italic", 
footer_font: "oblique", logo_font_family: "Comic Sans MS", header_font_family: "Comic Sans MS", home_name_font_family: "Comic Sans MS", 
home_description_font_family: "Comic Sans MS", what_i_do_name_font_family: "Comic Sans MS", what_i_do_description_font_family: "Comic Sans MS", 
who_i_am_name_font_family: "Comic Sans MS", who_i_am_description_font_family: "Comic Sans MS", album_name_font_family: "Comic Sans MS", 
album_description_font_family: "Comic Sans MS", my_work_name_font_family: "Comic Sans MS", my_work_description_font_family: "Comic Sans MS",
 contact_us_name_font_family: "Comic Sans MS", contact_us_description_font_family: "Comic Sans MS", footer_font_family: "Comic Sans MS", logo_font_size: "25px", 
 header_font_size: "15px", home_name_font_size: "60px", home_description_font_size: "20px", what_i_do_name_font_size: "40px", 
 what_i_do_description_font_size: "20px", who_i_am_name_font_size: "40px", who_i_am_description_font_size: "20px", album_name_font_size: "40px", 
 album_description_font_size: "20px", my_work_name_font_size: "40px", my_work_description_font_size: "20px", contact_us_name_font_size: "40px", 
 contact_us_description_font_size: "20px", footer_font_size: "15px"
 )
puts 'CREATED THEMES:'




