class SessionsController < Devise::SessionsController

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    sign_in(User, user)
    session[:user_id] = user.id
    if user.new_fb_user?
      render :action => :new
    else
      redirect_to root_url
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
