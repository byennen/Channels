class VideosController < ApplicationController
  load_and_authorize_resource :channel
  load_and_authorize_resource :video, :through => :channel
  
  respond_to :html
  
  def index
  end
  
  def show
  end
end
