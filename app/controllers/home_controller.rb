class HomeController < ApplicationController
  def index
    @posts = Post.recent
    @featured_song = Song.recent.first
    @featured_video = Video.recent.first
    @featured_album = Album.find_by_title('Alive At Brusy Mountain')
  end
end
