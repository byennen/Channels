class SongsController < ApplicationController

  def index
    @songs = Song.all
    render :json => @songs
  end

  def show
    @song = Song.find(params[:id], :include => {:album => :channel})
    if @song.present?
      respond_to do |format|
        format.json { render :json => @song }
        format.html {}
      end
    end
  end

  def next_song
    if @channels.present?
      render :json => {:title => "Channel song", :channels => @channels}
    else
      render :json => Song.next_song()
    end
  end

  def intro
    render :json => Song.intro_song()
  end

  def played
    @song = Song.find(params[:id])
    if current_user.facebook?
      Resque.enqueue(MemberWorker, :share_listen, {:user_id  => current_user.id,
                                                 :song_url => song_url(@song)})

    end
    render :text => ""
  end

end
