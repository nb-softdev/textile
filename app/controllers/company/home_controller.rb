class Company::HomeController < Company::CompanyApplicationController
  def index
  end
  def company_admin_dashboard
    
  end
  
  def photos
    if params[:type] == 'album'
      @album_or_category = Album.find(params[:id])
      @photos = @current_company.albums.where(:id => params[:id]).first.products
    else
      @album_or_category = Category.find(params[:id])
      @photos = @current_company.products.where(:category_id => params[:id])
    end  
  end
end
 