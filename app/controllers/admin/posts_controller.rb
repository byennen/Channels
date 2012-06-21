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
    if @post.contents.update_attributes(params[:post])
      flash[:notice] = "post was successfully updated."
    end
    respond_with @post, :location => admin_channel_posts_url
  end

  def destroy
    @post.contents.destroy
    redirect_to admin_channel_posts_url
  end

end
