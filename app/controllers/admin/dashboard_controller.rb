class Admin::DashboardController < Admin::ApplicationController
  load_and_authorize_resource :channel

  def index
    @channel = current_user.channel
    # if current_user.channel_master?
    #   redirect_to admin_channel_path(current_user.channel)
    # else
    #   authorize_admin
    # end
  end

  def channel_help
  end
end
