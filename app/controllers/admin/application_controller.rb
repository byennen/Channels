class Admin::ApplicationController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  def authorize_admin
    authorize! :manage, :admin_pages
  end
end
