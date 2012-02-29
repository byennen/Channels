class Admin::DashboardController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  
  def index
  end

  def help
  end
end
