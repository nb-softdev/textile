class SessionsController < Devise::SessionsController
  layout 'admin'

  def new
    super
  end
  
  def edit
    super
  end  

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    #respond_with resource, location: after_sign_in_path_for(resource)
    if current_user.is_admin
      respond_with resource, location: "/admin"
    else
      respond_with resource, location: "/company/admin/home"
    end    
  end
end
