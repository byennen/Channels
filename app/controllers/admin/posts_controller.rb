class Admin::PostsController < Admin::ApplicationController
  load_and_authorize_resource :channel
  load_and_authorize_resource :post, :through => :channel

  respond_to :html

  def index
    #@post_content = @post.contentable
  end

  def edit
  end

  def new
    @post = @channel.posts.new
  end

  def create
    if @post.save
      flash[:notice] = "post was successfully created."
    end
    respond_with @post, :location => admin_channel_posts_url
  end

  def update
    @post.attributes = params[:post]
    @post.publish_on = DateTime.strptime(params[:post][:publish_on], '%m/%d/%Y').to_time
    if @post.save
      flash[:notice] = "post was successfully updated."
      respond_with @post, :location => admin_channel_posts_url      
    else 
      render :action => 'edit'
    end
  end

  def destroy
    @post.contents.destroy
    redirect_to admin_channel_posts_url
  end

end
