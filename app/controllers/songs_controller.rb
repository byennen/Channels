class SongsController < ApplicationController

  def index
    @songs = Song.all
    render :json => @songs
  end

  def show
    @song = Song.find(params[:id], :include => {:album => :channel})
    @album = @song.album
    @channel = @album.channel
    if @song.present?
      respond_to do |format|
        format.html {}
        format.json { render :json => @song }
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
    if current_user && current_user.facebook?
      Resque.enqueue(MemberWorker, :share_listen, {:user_id  => current_user.id,
                       :song_url => song_url(@song)})

    end
    render :text => ""
  end
  
  def buy
    @song = Song.find(params[:id])
    @order = current_user.orders.new
    @order.line_items << LineItem.new(:song_id => @song, :price => 100)
    unless current_user.stripe_card_token
      current_user.create_stripe_customer(params[:user][:stripe_card_token])
    end
    if @order.save && @order.charge!
      Resque.enqueue(MemberWorker, :purchased_song, {:order_id => @order.id})
      respond_to do |format|
        flash[:notice] = "Thank you for purchasing - #{@song.title}"
        format.html { redirect_to :action => :show, :song => @song }
      end
    end
     

  end

end
