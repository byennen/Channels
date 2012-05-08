class Admin::ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_filter :authorize_admin

  def authorize_admin
    authorize! :manage, :admin_pages
  end

  # build channel parent and resource
  def resource_name
    self.class.name.gsub(/Controller/,'').underscore.singularize
  end

  def parent_name
    ""
  end

  def parent_class
    parent_name.classify.constantize
  end

  def resource_class
    resource_name.classify.constantize
  end

  def parent
    unless the_parent = instance_variable_get("@#{parent_name}")
      the_parent = parent_class.find(params["#{parent_name}_id"])
      instance_variable_set("@#{parent_name}", the_parent)
    end
    the_parent
  end

  def resource_params
    ret = (params[resource_name] || {})
    if parent_name.present?
      ret.merge(parent_name => parent)
    else
      ret
    end
  end

  def build_resource
    unless instance_variable_get("@#{resource_name}")
      instance_variable_set("@#{resource_name}", resource_class.new(resource_params))
    end
  end

  def resource
    resource_class.find(params[:id])
  end


  private
  def load_channels
    @channels = Channel.all
  end
end
