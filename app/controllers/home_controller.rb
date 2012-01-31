class HomeController < ApplicationController
  def index
    @channels = Channel.all
    @users = User.all
  end
end
