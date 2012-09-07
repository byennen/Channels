class ApplicationController < ActionController::Base
  layout 'layouts/frontend/application'
  protect_from_forgery
  before_filter :load_channels, :active_channels
  before_filter :load_channel, :giveaway

  helper_method :current_channel
  
  #delete after launch
  before_filter :verifies_staging_user

  #password for staging
  if (ENV["RAILS_ENV"] == "staging")
   before_filter :verifies_staging_user
  end

  def after_sign_in_path_for(resource)
    logger.debug("stored_location is #{stored_location_for(resource)}")
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

  def load_channel
    @channel = Channel.find_by_domain_or_subdomain(request.domain, request.subdomains)
    if @channel && request.domain != APP_CONFIG['domain']
      redirect_to "http://#{@channel.subdomain}.#{APP_CONFIG['domain']}"
    end
  end

  def current_channel
    @channel
  end

  def giveaway
    @giveaway = Giveaway.new
  end
  
  def load_channels
    @channels = Channel.order('name ASC')
  end

  def active_channels
    @active_channels_array = @channels.collect{|x| x.active{|y| y != true}}
    @active_channels = @active_channels_array.count(true)
  end

  rescue_from CanCan::AccessDenied do |exception|
    #Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"#
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
