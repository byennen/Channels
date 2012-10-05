class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def subscribe
    @trail_end_time = Time.now + 1.month
    if request.put?
      current_user.attributes = params[:user]
      if current_user.save
        flash[:notice] = "Thank you for becoming a paid member."
        respond_to do |format|
          if current_channel
            url =  "http://#{current_channel.subdomain}.#{APP_CONFIG['domain']}"
          else
            url = "http://www.#{APP_CONFIG['domain']}"
          end
          format.html { redirect_to url}
        end
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
  
  def downloads
    @songs = current_user.orders.collect(&:song)
  end
  
  def cancel
    if current_user.cancel_membership
      flash[:notice] = "Your membership has been canceled."
      redirect_to edit_user_registration_url(subdomain: "www")
    end
  end

  def preview
    current_user.preview_started_at = Time.now
    if current_user.save
      flash[:notice] = "Your free preview will expire in 1 day"
      if current_channel
        url =  "http://#{current_channel.subdomain}.#{APP_CONFIG['domain']}"
      else
        url = "http://www.#{APP_CONFIG['domain']}"
      end
      redirect_to url
    end
  end

end
