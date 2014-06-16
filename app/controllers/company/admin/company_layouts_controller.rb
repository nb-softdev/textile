class Company::Admin::CompanyLayoutsController < Company::Admin::CompanyAdminApplicationController
  before_action :set_company_layout, only: [:edit, :update]

  # GET /admin/company_layouts/1/edit
  def edit
  end

  # PATCH/PUT /admin/company_layouts/1
  # PATCH/PUT /admin/company_layouts/1.json
  def update
    respond_to do |format|
      if @company_layout.update(company_layout_params)
        format.html { redirect_to edit_company_admin_company_layout_path(@company_layout), notice: 'Company layout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company_layout.errors, status: :unprocessable_entity }
      end
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
