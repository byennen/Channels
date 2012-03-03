class Admin::UsersController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  def index
    @users = User.all
  end
end
