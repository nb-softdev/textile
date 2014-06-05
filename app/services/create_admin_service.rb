class CreateAdminService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email, is_admin: true) do |user|
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
      end
  end
end
