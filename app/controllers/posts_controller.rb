class PostsController < ApplicationController
  
  def index
    @posts = current_channel.present? ? @channel.posts.published.by_publish_on : Post.recent
  end
  
  def show
    @post = Post.published.find(params[:id])
    if current_user && current_user.facebook
      Resque.enqueue(MemberWorker, :share_read, {"user_id" => current_user.id, "article_url" => "http://4n7f.localtunnel.com" + post_path(@post)})
    end
  end
  
end
