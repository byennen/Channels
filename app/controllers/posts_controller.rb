class PostsController < ApplicationController
  
  def index
    @posts = current_channel.present? ? @channel.posts.published.by_published_on : Post.recent
  end
  
  def show
    @post = @channel.posts.published.find(params[:id])
  end
  
end
