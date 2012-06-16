class ApplicationController < ActionController::Base
  layout 'layouts/frontend/application'
  protect_from_forgery
  before_filter :load_channels

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
  
  def host_base
    request.host.match(/(.*)\.\w{3}$/)[1]
  end
  
  def load_channel
    channel_key = request.subdomain.present? ? request.subdomain : host_base
    @channel = Channel.find_by_subdomain!(channel_key)
  end

  def load_channels
    @channels = Channel.order('name ASC')
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def verifies_staging_user
    unless cookies[:altimarc]
      authenticate_or_request_with_http_basic do |username, password|
        username == "altimarc" && password == "altimarc2012"
        cookies[:altimarc] = {:value => "staging", :expires => 5.days.from_now.utc, :domain => :all}
      end
    end
  end

end
