class Order < ActiveRecord::Base

  attr_accessible :user_id, :stripe_invoice

  belongs_to :user
  has_many :line_items

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
    Stripe::Charge.create(
          :amount => amount,
          :currency => "usd",
          :customer => user.stripe_customer_token,
          :description => "Charge for #{user.email} - #{song.title}"
    ) 
  end
  
end
