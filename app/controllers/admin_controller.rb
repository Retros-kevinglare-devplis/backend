class AdminController < ApplicationController
  before_action :authenticate_admin_user!
  layout 'admin'

  def after_sign_in_path_for(_resource)
    admin_dashboard_path(current_admin_user)
  end
end
