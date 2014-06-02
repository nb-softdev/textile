class PasswordsController < Devise::PasswordsController
    prepend_before_filter :require_no_authentication
    # Render the #edit only if coming from a reset password email link
    append_before_filter :assert_reset_token_passed, :only => :edit

    layout 'admin'

    def new
      super
    end

    def create
        super
    end

    def edit
        self.resource = resource_class.new
        resource.reset_password_token = params[:reset_password_token]
    end

    def update
        self.resource = resource_class.reset_password_by_token(resource_params)

        if resource.errors.empty?
            flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
            set_flash_message(:notice, "New password has been saved")
            redirect_to new_user_session_path
            else
            respond_with resource
        end
    end

    protected

    # The path used after sending reset password instructions
    def after_sending_reset_password_instructions_path_for(resource_name)
        new_session_path(resource_name)
    end

    # Check if a reset_password_token is provided in the request
    def assert_reset_token_passed
        if params[:reset_password_token].blank?
            set_flash_message(:error, :no_token)
            redirect_to new_session_path(resource_name)
        end
    end

    # Check if proper Lockable module methods are present & unlock strategy
    # allows to unlock resource on password reset
    def unlockable?(resource)
        resource.respond_to?(:unlock_access!) &&
        resource.respond_to?(:unlock_strategy_enabled?) &&
        resource.unlock_strategy_enabled?(:email)
    end
end