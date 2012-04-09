class HomeController < ApplicationController
  before_filter :load_channels

  def index
    @users = User.all
  end
end
