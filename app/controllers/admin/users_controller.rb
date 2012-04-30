class Admin::UsersController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  load_and_authorize_resource

  respond_to :html

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User was successfully created"
    end
    respond_with @user, :location => admin_users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    user_params = params[:user].dup
    [:password, :password_confirmation].each do |field|
      user_params.delete(field) if user_params[field].blank?
    end

    if @user.update_attributes(user_params)
      flash[:notice] = "User was successfully updated"
    end
    respond_with @user, :location => admin_users_path
  end
end
