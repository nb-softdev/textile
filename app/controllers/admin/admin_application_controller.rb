class Admin::AdminApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  PER_PAGE = 10
  
  protect_from_forgery with: :exception
  
  helper_method :sort_column, :sort_direction

  layout 'admin'
  
  before_action :authenticate_user!
  
  before_filter :restrict_admin_users

  def restrict_admin_users
    raise ActionController::RoutingError.new('Not Found') unless (current_user.is_admin)
  end 
 
  def sort_column(sort='')
    controller_name.classify.constantize.column_names.include?(sort) ? sort : "id"
  end

  def sort_direction(direction='')
    %w[asc desc].include?(direction) ? direction : "desc"
  end
  
end