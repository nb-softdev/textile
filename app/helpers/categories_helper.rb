module CategoriesHelper
  def subcat_prefix(depth)
    ("&nbsp;" * 4 * depth).html_safe
  end
  
  def category_options_array(categories=[], parent_id=nil, depth=0)
    Category.where(category_id: parent_id).order(:id).each do |category|
      categories << [subcat_prefix(depth) + category.name, category.id]
      category_options_array(categories, category.id, depth+1)
    end
  
    categories
  end  
end
