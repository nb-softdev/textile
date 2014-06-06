class Admin::AlbumProductsController < Admin::AdminApplicationController  
  before_action :set_album_product, only: [:show, :edit, :update, :destroy]
  
  before_action :set_album

  # GET /admin/album_products
  # GET /admin/album_products.json
  def index
    @album_products = AlbumProduct.order(sort_column(params[:sort]) + " " + sort_direction(params[:direction])).paginate(:per_page => PER_PAGE, :page => params[:page])
    @album_product = AlbumProduct.new
  end

  # GET /admin/album_products/1
  # GET /admin/album_products/1.json
  def show
  end

  # GET /admin/album_products/new
  def new
    @album_product = AlbumProduct.new
  end

  # GET /admin/album_products/1/edit
  def edit
  end

  # POST /admin/album_products
  # POST /admin/album_products.json
  def create
    @album_product = AlbumProduct.new(album_product_params)
    @album_products = AlbumProduct.order(sort_column(params[:sort]) + " " + sort_direction(params[:direction])).paginate(:per_page => PER_PAGE, :page => params[:page])
    respond_to do |format|
      if @album_product.save
        format.html {  render action: 'index', notice: 'Album product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @album_product }
      else
        format.html { render action: 'new' }
        format.json { render json: @album_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/album_products/1
  # PATCH/PUT /admin/album_products/1.json
  def update
    respond_to do |format|
      if @album_product.update(album_product_params)
        format.html {  render action: 'edit', notice: 'Album product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @album_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/album_products/1
  # DELETE /admin/album_products/1.json
  def destroy
    @album_product.destroy
    respond_to do |format|
      format.html { redirect_to admin_album_album_products_url(@album), notice: 'Album product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_product
      @album_product = AlbumProduct.find(params[:id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:album_id])
    end    

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_product_params
      params.require(:album_product).permit(:album_id, :product_id)
    end
end
