class Company::Admin::AlbumsController < Company::Admin::CompanyAdminApplicationController  
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  # GET /admin/albums
  # GET /admin/albums.json
  def index
    @albums = @current_company.albums.includes(:company).order(sort_column(params[:sort]) + " " + sort_direction(params[:direction])).paginate(:per_page => PER_PAGE, :page => params[:page])
  end

  # GET /admin/albums/1
  # GET /admin/albums/1.json
  def show
  end

  # GET /admin/albums/new
  def new
    @album = Album.new
  end

  # GET /admin/albums/1/edit
  def edit
  end

  # POST /admin/albums
  # POST /admin/albums.json
  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to [:company_admin, @album], notice: 'Album was successfully created.' }
        format.json { render action: 'show', status: :created, location: @album }
      else
        format.html { render action: 'new' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/albums/1
  # PATCH/PUT /admin/albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to [:company_admin, @album], notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/albums/1
  # DELETE /admin/albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to company_admin_albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:company_id, :name, :description, :code, :is_active)
    end
end
