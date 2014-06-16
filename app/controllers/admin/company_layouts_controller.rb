class Admin::CompanyLayoutsController < Admin::AdminApplicationController
  before_action :set_company_layout, only: [:show, :edit, :update, :destroy]

  # GET /admin/company_layouts
  # GET /admin/company_layouts.json
  def index
    @company_layouts = CompanyLayout.includes(:company).order(sort_column(params[:sort]) + " " + sort_direction(params[:direction])).paginate(:per_page => PER_PAGE, :page => params[:page])
  end

  # GET /admin/company_layouts/1
  # GET /admin/company_layouts/1.json
  def show
  end

  # GET /admin/company_layouts/new
  def new
    @company_layout = CompanyLayout.new
  end

  # GET /admin/company_layouts/1/edit
  def edit
  end

  # POST /admin/company_layouts
  # POST /admin/company_layouts.json
  def create
    @company_layout = CompanyLayout.new(company_layout_params)

    respond_to do |format|
      if @company_layout.save
        format.html { redirect_to [:admin, @company_layout], notice: 'Company layout was successfully created.' }
        format.json { render action: 'show', status: :created, location: @company_layout }
      else
        format.html { render action: 'new' }
        format.json { render json: @company_layout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/company_layouts/1
  # PATCH/PUT /admin/company_layouts/1.json
  def update
    respond_to do |format|
      if @company_layout.update(company_layout_params)
        format.html { redirect_to [:admin, @company_layout], notice: 'Company layout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company_layout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/company_layouts/1
  # DELETE /admin/company_layouts/1.json
  def destroy
    @company_layout.destroy
    respond_to do |format|
      format.html { redirect_to admin_company_layouts_url, notice: 'Company layout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_layout
      @company_layout = CompanyLayout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_layout_params
      params.require(:company_layout).permit!
    end
end
