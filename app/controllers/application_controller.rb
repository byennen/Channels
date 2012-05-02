class ApplicationController < ActionController::Base
  protect_from_forgery

  #password for staging
  if (ENV["RAILS_ENV"] == "staging")
   before_filter :verifies_staging_user
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(User)
        if resource.admin?
          admin_root_path
        elsif resource.channel_master?
          admin_channel_path(resource.channel)
        else
          super
        end
      else
        super
      end
  end

  private

  def load_channels
    @channels = Channel.all
  end

  def load_channel
    @channel = Channel.find_by_subdomain!(request.subdomain)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def verifies_staging_user
    authenticate_or_request_with_http_basic do |username, password|
      username == "altimarc" && password == "altimarc2012"
    end
  end

end
