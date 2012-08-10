class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
  
  def show
  end
end
