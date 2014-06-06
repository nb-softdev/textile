class HomeController < ApplicationController
  def contact_us_save
    @contact_us = ContactUs.new(contact_us_params)
    if @contact_us.save
      flash[:notice] = 'Inquiry sent successfully'
    end
  end
  
  private
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_us_params
    params.require(:contact_us).permit!
  end  
end
