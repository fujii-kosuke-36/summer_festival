class Admin::DashboardsController < Admin::BaseController
  skip_before_action :check_admin, only: %i[index] 
  def index; end
end
