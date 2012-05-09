class Admin::DashboardController < Admin::ApplicationController
  before_filter :authorize_admin, :except => [:index]

  def index
    if current_user.channel_master?
      redirect_to admin_channel_path(current_user.channel)
    else
      authorize_admin
    end
  end

  def help
  end
end
