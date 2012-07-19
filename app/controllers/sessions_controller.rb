class SessionsController < Devise::SessionsController
  layout 'frontend/sessions'
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    logger.debug("Logging in user")
    sign_in(User, user)
    session[:user_id] = user.id
    logger.debug("redirecting to sigin")
    #redirect_to new_session_url
    render :action => :new
  end

  def create_password
    current_user.attributes = params[:user]
    if current_user.save
      redirect_to root_url
    end
  end

  #def destroy
    #session[:user_id] = nil
    #redirect_to root_url
  #end
  #
end
