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

  def password
    render :text => "This is where the new password page is"
  end
  #def destroy
    #session[:user_id] = nil
    #redirect_to root_url
  #end
  #
end
