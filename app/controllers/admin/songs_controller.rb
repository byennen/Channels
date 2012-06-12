class Admin::SongsController < Admin::ApplicationController
  load_and_authorize_resource :channel
  load_and_authorize_resource :album
  load_and_authorize_resource :song, :through => :album

  respond_to :html, :json

  def index; end

  def new; end

  def edit; end

  def create
    @song.attributes = params[:song]
    if @song.save
      respond_to do |format|
        format.html {  
          render :json => [@song.to_jq_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        format.json {  
          render :json => [@song.to_jq_upload].to_json			
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def update
    if @song.update_attributes(params[:song])
      flash[:notice] = "Song was successfully updated."
    end
    respond_with @song, :location => admin_channel_album_songs_url
  end

  def destroy
    @song.destroy
    redirect_to admin_channel_album_songs_url
  end

end
  