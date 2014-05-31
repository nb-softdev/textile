# override sign-up behaviour
class RegistrationsController < Devise::RegistrationsController

  layout 'admin'

  def edit
    super
  end

  protected

  def after_update_path_for(resource)
    user_path(resource)
  end

end
