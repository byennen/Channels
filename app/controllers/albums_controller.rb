class AlbumsController < ApplicationController
  
  def index
    @albums = Album.all
  end
  
  def show
    @album = Album.find(params[:id])
    @songs = @album.songs.all(:order => "position")
    @featured_video = Video.recent.first
  end

  def buy
    @album = Album.find(params[:id])
    @order = current_user.orders.new
    @order.line_items << LineItem.new(:purchasable => @album, :price => @album.current_price_in_cents)
    unless current_user.stripe_customer_token
      current_user.create_stripe_customer(params[:user][:stripe_card_token])
    end
    if @order.save && @order.charge!
      Resque.enqueue(MemberWorker, :purchased_album, {:order_id => @order.id})
      respond_to do |format|
        flash[:notice] = "Thank you for purchasing - #{@song.title}"
        format.html { redirect_to downloads_user_url }
      end
    end
  end
  
end
