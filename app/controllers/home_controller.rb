class HomeController < ApplicationController
  def index
    @posts = Post.recent
    @songs = Song.recent
    @videos = Video.recent
  end
end
