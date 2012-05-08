class Admin::DashboardController < Admin::ApplicationController
  layout 'admin'
  before_filter :authenticate_user!, :load_channels
  
  def index
  end

  def help
  end
end
