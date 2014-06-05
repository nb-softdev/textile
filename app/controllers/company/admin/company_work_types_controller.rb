class Company::Admin::CompanyWorkTypesController < Company::Admin::CompanyAdminApplicationController  
  before_action :set_company_work_type, only: [:show, :edit, :update, :destroy]

  autocomplete :work_type, :name, :full => true

  # GET /company_work_types
  # GET /company_work_types.json
  def index
    @company_work_types = @current_company.company_work_types.order(sort_column(params[:sort]) + " " + sort_direction(params[:direction])).paginate(:per_page => PER_PAGE, :page => params[:page])
  end

  # GET /company_work_types/1
  # GET /company_work_types/1.json
  def show
  end

  # GET /company_work_types/new
  def new
    @company_work_type = CompanyWorkType.new
  end

  # GET /company_work_types/1/edit
  def edit
  end

  # POST /company_work_types
  # POST /company_work_types.json
  def create
    respond_to do |format|
      if params[:work_type_name].present?
        work_type = WorkType.find_or_create_by(name: params[:work_type_name])
        params[:company_work_type][:work_type_id] = work_type.id        
        @company_work_type = CompanyWorkType.new(company_work_type_params)
        if @company_work_type.save
          format.html { redirect_to company_admin_company_work_types_url, notice: 'Company Work Type was successfully created.' }
          format.json { render :show, status: :created, location: @company_work_type }
        else
          format.html { render :new }
          format.json { render json: @company_work_type.errors, status: :unprocessable_entity }
        end
      else
        @company_work_type = CompanyWorkType.new(company_work_type_params)
        format.html { render :new }
        format.json { render json: @company_work_type.errors, status: :unprocessable_entity }        
      end    
    end
  end

  # PATCH/PUT /company_work_types/1
  # PATCH/PUT /company_work_types/1.json
  def update
    respond_to do |format|
      if params[:work_type_name].present?
        work_type = WorkType.find_or_create_by(name: params[:work_type_name])
        params[:company_work_type][:work_type_id] = work_type.id      
        if @company_work_type.update(company_work_type_params)
          format.html { redirect_to company_admin_company_work_types_url, notice: 'Company Work Type was successfully updated.' }
          format.json { render :show, status: :ok, location: @company_work_type }
        else
          format.html { render :edit }
          format.json { render json: @company_work_type.errors, status: :unprocessable_entity }
        end
      else  
        format.html { render :edit }
        format.json { render json: @company_work_type.errors, status: :unprocessable_entity }        
      end  
    end
  end

  # DELETE /company_work_types/1
  # DELETE /company_work_types/1.json
  def destroy
    work_type_id = @company_work_type.work_type_id
    @company_work_type.destroy
    
    #destroy work type if no longer use in company.
    work_type = WorkType.find(work_type_id)
    unless work_type.is_default
      company_work_type = work_type.company_work_types.first
      unless company_work_type
        work_type.destroy
      end
    end
      
    respond_to do |format|
      format.html { redirect_to company_admin_company_work_types_url, notice: 'Company Work Type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_work_type
      @company_work_type = CompanyWorkType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_work_type_params
      params.require(:company_work_type).permit!
    end
end
