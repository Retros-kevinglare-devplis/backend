class AdminController < ApplicationController
  helper_method :nav_active
  add_flash_types :info, :error, :success
  before_action :authenticate_admin_user!
  layout 'admin'

  def after_sign_in_path_for(_resource)
    admin_dashboard_path(current_admin_user)
  end

  def nav_active(nav)
    if params['controller'] == 'admin/static'
      'active' if params[:action] == nav
    else
      'active' if params['controller'].include?(nav)
    end
  end
end
