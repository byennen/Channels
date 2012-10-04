class Order < ActiveRecord::Base

  attr_accessible :user_id, :stripe_invoice

  belongs_to :user
  has_many :line_items

  def total
    line_items.map(&:price).sum
  end

  def amount
    line_items.first.price
  end

  def song
    if line_items.first.purchasable.kind_of?(Song)
      line_items.first.purchasable
    else
      line_items.first.purchasable.songs.first
    end
  end

  def charge!
    logger.debug("total is " + total.to_s)
    Stripe::Charge.create(
          :amount => total,
          :currency => "usd",
          :customer => user.stripe_customer_token,
          :description => "Charge for #{user.email} - #{song.title}"
    ) 
  end
  
end
