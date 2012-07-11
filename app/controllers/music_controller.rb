class MusicController < ApplicationController
  def index
    @songs = Song.recent
  end
end
