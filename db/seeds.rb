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





