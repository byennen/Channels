class PhotosController < ApplicationController
  def index
    @channels = Channel.all
    @photos = Photo.all
  end
  
  def show
  end
end
