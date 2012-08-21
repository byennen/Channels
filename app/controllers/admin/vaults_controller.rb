class Admin::VaultsController < Admin::ApplicationController
  load_and_authorize_resource :channel
  #load_and_authorize_resource :vault, :through => :channel

  respond_to :html
  
  def index
    #@vault_content = @vault.contentable
  end

  def edit
  end

  def new
    @vault = Vault.contents.new
  end
  
  def create
    if @vault.contents.save
      flash[:notice] = "Vault was successfully created."
    end
    respond_with @vault, :location => admin_channel_vaults_url
  end

  def update
    if @vault.contents.update_attributes(params[:vault])
      flash[:notice] = "Vault was successfully updated."
    end
    respond_with @vault, :location => admin_channel_vaults_url
  end

  def destroy
    @vault.contents.destroy
    redirect_to admin_channel_vaults_url
  end
end
