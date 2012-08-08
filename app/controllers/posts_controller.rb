class PostsController < ApplicationController
  
  def index
    @posts = current_channel.present? ? @channel.posts.published.by_published_on : Post.recent
  end
  
  def show
    @post = @channel.posts.published.find(params[:id])
    if current_user && current_user.facebook
      Resque.enqueue(MemberWorker, :share_read, {"user_id" => current_user.id, "article_url" => post_url(@post)})
    end
  end
  
end
