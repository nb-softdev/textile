class Company::HomeController < Company::CompanyApplicationController
  def index
		@photos = @current_company.products
  end
  
  def company_admin_dashboard
    
  end
  
  def photos
    if params[:type] == 'album'
      @album_or_category = Album.find(params[:id])
      @photos = @current_company.albums.includes(:products).where(:id => params[:id]).first.products
    elsif  params[:type] == 'category'
      @album_or_category = Category.find(params[:id])
      @photos = @current_company.products.where(:category_id => params[:id])
    else
			@photos = @current_company.products
    end 
  end
end
 
