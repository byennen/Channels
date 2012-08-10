class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def subscribe
    
    current_user.attributes = params[:user]
    if current_user.save
      respond_to do |format|
        format.json { render :json => current_user }
      end
    end
  end
  
  def create_password
    current_user.attributes = params[:user]
    if current_user.save
      sign_in(current_user, :bypass => true)
      current_user.update_attribute(:new_fb_user, false)
      Resque.enqueue(MemberWorker, :send_welcome, {"user_id" => current_user.id})
      redirect_to root_url
    else
      render '/sessions/new'
    end
  end

end
