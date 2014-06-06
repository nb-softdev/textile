class Company::AlbumsController < Company::CompanyApplicationController    
  before_action :set_album, only: [:show]
  
  # GET /admin/albums
  # GET /admin/albums.json
  def index
    @albums = @current_company.albums
  end

  # GET /admin/albums/1
  # GET /admin/albums/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

end
