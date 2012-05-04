class HomeController < ApplicationController
  before_filter :load_channels

  def index
    @channels = Channel.all
  end
end
