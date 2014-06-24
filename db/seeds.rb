# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or CREATE alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts '--- '
puts '--- CREATE ADMIN USER:'
puts '--- '
user = CreateAdminService.new.call

puts '--- '
puts 'CREATE WORK TYPES:'
puts '--- '
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

puts '--- '
puts '--- CREATE CATEGORIES:'
puts '--- '
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

puts '--- '
puts '--- CREATE THEMES:'
puts '--- '

puts ' ---    Blue Theme'
company_layout = CompanyLayout.find_or_create_by(
	theme_name: "Blue Theme", theme_type: "blue_theme", header_background_color: "#b7bec9", header_text_background_color: "#e0e026", home_background_color: "#b7bec9", 
	what_i_do_background_color: "#b7bec9", who_i_am_background_color: "#b7bec9", my_work_background_color: "#b7bec9", album_background_color: "#b7bec9", 
	album_sidebar_background_color: "#e0e026", contact_us_background_color: "#e0e026", footer_background_color: "#b7bec9", logo_font_color: "#e0e026", 
	header_font_color: "#b7bec9", home_name_font_color: "#e0e026", home_description_font_color: "#4382cb", what_i_do_name_font_color: "#e0e026", 
	what_i_do_description_font_color: "#4382cb", who_i_am_name_font_color: "#e0e026", who_i_am_description_font_color: "#4382cb", 
	album_name_font_color: "#e0e026", album_description_font_color: "#4382cb", my_work_name_font_color: "#e0e026", my_work_description_font_color: "#4382cb", 
	contact_us_name_font_color: "#e0e026", contact_us_description_font_color: "#4382cb", footer_font_color: "#e0e026", header_font: "normal", 
	home_name_font: "normal", home_description_font: "italic", what_i_do_name_font: "normal", what_i_do_description_font: "italic", 
	who_i_am_name_font: "normal", who_i_am_description_font: "italic", album_name_font: "normal", album_description_font: "italic", 
	my_work_name_font: "normal", my_work_description_font: "italic", contact_us_name_font: "normal", contact_us_description_font: "italic", 
	
	footer_font: "oblique", logo_font_family: "smile_paraderegular", header_font_family: "generationregular", home_name_font_family: "generationregular", 
	home_description_font_family: "mariana_familyregular", what_i_do_name_font_family: "generationregular", what_i_do_description_font_family: "mariana_familyregular", 
	who_i_am_name_font_family: "generationregular", who_i_am_description_font_family: "mariana_familyregular", album_name_font_family: "generationregular", 
	album_description_font_family: "Arial Black,Sans Serif", my_work_name_font_family: "Arial Black,Sans Serif", my_work_description_font_family: "mariana_familyregular",
	contact_us_name_font_family: "generationregular", contact_us_description_font_family: "mariana_familyregular", footer_font_family: "mariana_familyregular", 
	logo_font_size: "40px", header_font_size: "15px", home_name_font_size: "40px", home_description_font_size: "20px", what_i_do_name_font_size: "40px", 
	what_i_do_description_font_size: "20px", who_i_am_name_font_size: "40px", who_i_am_description_font_size: "20px", album_name_font_size: "40px", 
	album_description_font_size: "15px", my_work_name_font_size: "40px", my_work_description_font_size: "20px", contact_us_name_font_size: "40px",
	contact_us_description_font_size: "20px", footer_font_size: "15px"
 )
company_layout.front_background1 = File.new("#{Rails.root}/db/seeds/assets/images/themes/blue_theme/front_background1.jpeg") 
company_layout.front_background2 = File.new("#{Rails.root}/db/seeds/assets/images/themes/blue_theme/front_background2.jpeg") 
company_layout.front_background3 = File.new("#{Rails.root}/db/seeds/assets/images/themes/blue_theme/front_background3.jpeg") 
company_layout.front_background4 = File.new("#{Rails.root}/db/seeds/assets/images/themes/blue_theme/front_background4.jpeg")
company_layout.save


puts ' ---    Black Theme'
company_layout = CompanyLayout.find_or_create_by(
	theme_name: "Black Theme", theme_type: "black_theme", header_background_color: "#b7bec9", header_text_background_color: "#070b21", home_background_color: "#b7bec9", 
	what_i_do_background_color: "#b7bec9", who_i_am_background_color: "#b7bec9", my_work_background_color: "#b7bec9", album_background_color: "#b7bec9", 
	album_sidebar_background_color: "#070b21", contact_us_background_color: "#070b21", footer_background_color: "#b7bec9", logo_font_color: "#070b21", 
	header_font_color: "#b7bec9", home_name_font_color: "#070b21", home_description_font_color: "#4382cb", what_i_do_name_font_color: "#070b21", 
	what_i_do_description_font_color: "#4382cb", who_i_am_name_font_color: "#070b21", who_i_am_description_font_color: "#4382cb", 
	album_name_font_color: "#070b21", album_description_font_color: "#4382cb", my_work_name_font_color: "#070b21", my_work_description_font_color: "#4382cb", 
	contact_us_name_font_color: "#070b21", contact_us_description_font_color: "#4382cb", footer_font_color: "#070b21", header_font: "normal", 
	home_name_font: "normal", home_description_font: "italic", what_i_do_name_font: "normal", what_i_do_description_font: "italic", 
	who_i_am_name_font: "normal", who_i_am_description_font: "italic", album_name_font: "normal", album_description_font: "italic", 
	my_work_name_font: "normal", my_work_description_font: "italic", contact_us_name_font: "normal", contact_us_description_font: "italic", 
  footer_font: "oblique", logo_font_family: "smile_paraderegular", header_font_family: "generationregular", home_name_font_family: "generationregular", 
  home_description_font_family: "mariana_familyregular", what_i_do_name_font_family: "generationregular", what_i_do_description_font_family: "mariana_familyregular", 
  who_i_am_name_font_family: "generationregular", who_i_am_description_font_family: "mariana_familyregular", album_name_font_family: "generationregular", 
  album_description_font_family: "Arial Black,Sans Serif", my_work_name_font_family: "Arial Black,Sans Serif", my_work_description_font_family: "mariana_familyregular",
  contact_us_name_font_family: "generationregular", contact_us_description_font_family: "mariana_familyregular", footer_font_family: "mariana_familyregular", 
  logo_font_size: "40px", header_font_size: "15px", home_name_font_size: "40px", home_description_font_size: "20px", what_i_do_name_font_size: "40px", 
  what_i_do_description_font_size: "20px", who_i_am_name_font_size: "40px", who_i_am_description_font_size: "20px", album_name_font_size: "40px", 
  album_description_font_size: "15px", my_work_name_font_size: "40px", my_work_description_font_size: "20px", contact_us_name_font_size: "40px",
  contact_us_description_font_size: "20px", footer_font_size: "15px"
 )
company_layout.front_background1 = File.new("#{Rails.root}/db/seeds/assets/images/themes/black_theme/front_background1.jpeg") 
company_layout.front_background2 = File.new("#{Rails.root}/db/seeds/assets/images/themes/black_theme/front_background2.jpeg") 
company_layout.front_background3 = File.new("#{Rails.root}/db/seeds/assets/images/themes/black_theme/front_background3.jpeg") 
company_layout.front_background4 = File.new("#{Rails.root}/db/seeds/assets/images/themes/black_theme/front_background4.jpeg")
company_layout.save

puts ' ---    Pink Theme'
company_layout = CompanyLayout.find_or_create_by(
	theme_name: "Pink Theme", theme_type: "pink_theme", header_background_color: "#b7bec9", header_text_background_color: "#FFBDC5", home_background_color: "#b7bec9", 
	what_i_do_background_color: "#b7bec9", who_i_am_background_color: "#b7bec9", my_work_background_color: "#b7bec9", album_background_color: "#b7bec9", 
	album_sidebar_background_color: "#FFBDC5", contact_us_background_color: "#FFBDC5", footer_background_color: "#b7bec9", logo_font_color: "#FFBDC5", 
	header_font_color: "#b7bec9", home_name_font_color: "#FFBDC5", home_description_font_color: "#4382cb", what_i_do_name_font_color: "#FFBDC5", 
	what_i_do_description_font_color: "#4382cb", who_i_am_name_font_color: "#FFBDC5", who_i_am_description_font_color: "#4382cb", 
	album_name_font_color: "#FFBDC5", album_description_font_color: "#4382cb", my_work_name_font_color: "#FFBDC5", my_work_description_font_color: "#4382cb", 
	contact_us_name_font_color: "#FFBDC5", contact_us_description_font_color: "#4382cb", footer_font_color: "#FFBDC5", header_font: "normal", 
	home_name_font: "normal", home_description_font: "italic", what_i_do_name_font: "normal", what_i_do_description_font: "italic", 
	who_i_am_name_font: "normal", who_i_am_description_font: "italic", album_name_font: "normal", album_description_font: "italic", 
	my_work_name_font: "normal", my_work_description_font: "italic", contact_us_name_font: "normal", contact_us_description_font: "italic", 
  footer_font: "oblique", logo_font_family: "smile_paraderegular", header_font_family: "generationregular", home_name_font_family: "generationregular", 
  home_description_font_family: "mariana_familyregular", what_i_do_name_font_family: "generationregular", what_i_do_description_font_family: "mariana_familyregular", 
  who_i_am_name_font_family: "generationregular", who_i_am_description_font_family: "mariana_familyregular", album_name_font_family: "generationregular", 
  album_description_font_family: "Arial Black,Sans Serif", my_work_name_font_family: "Arial Black,Sans Serif", my_work_description_font_family: "mariana_familyregular",
  contact_us_name_font_family: "generationregular", contact_us_description_font_family: "mariana_familyregular", footer_font_family: "mariana_familyregular", 
  logo_font_size: "40px", header_font_size: "15px", home_name_font_size: "40px", home_description_font_size: "20px", what_i_do_name_font_size: "40px", 
  what_i_do_description_font_size: "20px", who_i_am_name_font_size: "40px", who_i_am_description_font_size: "20px", album_name_font_size: "40px", 
  album_description_font_size: "15px", my_work_name_font_size: "40px", my_work_description_font_size: "20px", contact_us_name_font_size: "40px",
  contact_us_description_font_size: "20px", footer_font_size: "15px"
 )
company_layout.front_background1 = File.new("#{Rails.root}/db/seeds/assets/images/themes/pink_theme/front_background1.jpeg") 
company_layout.front_background2 = File.new("#{Rails.root}/db/seeds/assets/images/themes/pink_theme/front_background2.jpeg") 
company_layout.front_background3 = File.new("#{Rails.root}/db/seeds/assets/images/themes/pink_theme/front_background3.jpeg") 
company_layout.front_background4 = File.new("#{Rails.root}/db/seeds/assets/images/themes/pink_theme/front_background4.jpeg")
company_layout.save

puts ' ---    Purple Theme'
company_layout = CompanyLayout.find_or_create_by(
	theme_name: "Purple Theme", theme_type: "purple_theme", header_background_color: "#b7bec9", header_text_background_color: "#1C001C", home_background_color: "#b7bec9", 
	what_i_do_background_color: "#b7bec9", who_i_am_background_color: "#b7bec9", my_work_background_color: "#b7bec9", album_background_color: "#b7bec9", 
	album_sidebar_background_color: "#1C001C", contact_us_background_color: "#1C001C", footer_background_color: "#b7bec9", logo_font_color: "#1C001C", 
	header_font_color: "#b7bec9", home_name_font_color: "#1C001C", home_description_font_color: "#4382cb", what_i_do_name_font_color: "#1C001C", 
	what_i_do_description_font_color: "#4382cb", who_i_am_name_font_color: "#1C001C", who_i_am_description_font_color: "#4382cb", 
	album_name_font_color: "#1C001C", album_description_font_color: "#4382cb", my_work_name_font_color: "#1C001C", my_work_description_font_color: "#4382cb", 
	contact_us_name_font_color: "#1C001C", contact_us_description_font_color: "#4382cb", footer_font_color: "#1C001C", header_font: "normal", 
	home_name_font: "normal", home_description_font: "italic", what_i_do_name_font: "normal", what_i_do_description_font: "italic", 
	who_i_am_name_font: "normal", who_i_am_description_font: "italic", album_name_font: "normal", album_description_font: "italic", 
	my_work_name_font: "normal", my_work_description_font: "italic", contact_us_name_font: "normal", contact_us_description_font: "italic", 
  footer_font: "oblique", logo_font_family: "smile_paraderegular", header_font_family: "generationregular", home_name_font_family: "generationregular", 
  home_description_font_family: "mariana_familyregular", what_i_do_name_font_family: "generationregular", what_i_do_description_font_family: "mariana_familyregular", 
  who_i_am_name_font_family: "generationregular", who_i_am_description_font_family: "mariana_familyregular", album_name_font_family: "generationregular", 
  album_description_font_family: "Arial Black,Sans Serif", my_work_name_font_family: "Arial Black,Sans Serif", my_work_description_font_family: "mariana_familyregular",
  contact_us_name_font_family: "generationregular", contact_us_description_font_family: "mariana_familyregular", footer_font_family: "mariana_familyregular", 
  logo_font_size: "40px", header_font_size: "15px", home_name_font_size: "40px", home_description_font_size: "20px", what_i_do_name_font_size: "40px", 
  what_i_do_description_font_size: "20px", who_i_am_name_font_size: "40px", who_i_am_description_font_size: "20px", album_name_font_size: "40px", 
  album_description_font_size: "15px", my_work_name_font_size: "40px", my_work_description_font_size: "20px", contact_us_name_font_size: "40px",
  contact_us_description_font_size: "20px", footer_font_size: "15px"
 )
company_layout.front_background1 = File.new("#{Rails.root}/db/seeds/assets/images/themes/purple_theme/front_background1.jpeg") 
company_layout.front_background2 = File.new("#{Rails.root}/db/seeds/assets/images/themes/purple_theme/front_background2.jpeg") 
company_layout.front_background3 = File.new("#{Rails.root}/db/seeds/assets/images/themes/purple_theme/front_background3.jpeg") 
company_layout.front_background4 = File.new("#{Rails.root}/db/seeds/assets/images/themes/purple_theme/front_background4.jpeg")
company_layout.save
