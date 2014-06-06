class Admin::ContactUsController < Admin::AdminApplicationController  
  before_action :set_contact_us, only: [:destroy]

  # GET /contact_uss
  # GET /contact_uss.json
  def index
    @contact_us = ContactUs.where("company_id IS NULL").paginate(:per_page => PER_PAGE, :page => params[:page])
  end

  # DELETE /contact_us/1
  # DELETE /contact_us/1.json
  def destroy
    @contact_us.destroy
    respond_to do |format|
      format.html { redirect_to admin_contact_us_url, notice: 'Contact us was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_us
      @contact_us = ContactUs.find(params[:id])
    end

end
