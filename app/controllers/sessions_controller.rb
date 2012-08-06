class SessionsController < Devise::SessionsController

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    logger.debug("session is #{session.inspect}")
    sign_in(User, user)
    session[:user_id] = user.id
    if user.new_fb_user?
      render :action => :new
    else
      if channel = Channel.find_by_uuid(params[:state])
        redirect_to "http://#{channel.subdomain}.#{APP_CONFIG['domain']}"
      else
        redirect_to root_url
      end
    end
  end

  def create_password
    current_user.attributes = params[:user]
    if current_user.save
      current_user.update_attribute(:new_fb_user, false)
      redirect_to root_url
    else
      render :action => :new
    end
  end

end
