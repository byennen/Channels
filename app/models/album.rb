class Album < ActiveRecord::Base

  belongs_to :channel
  has_many :songs

  attr_accessible :id, :channel_id, :title, :description, :image, :channel, 
                  :active, :price, :publish_at, :preorder, :preorder_price,
                  :release_date

  image_accessor :image

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  money :price
  money :preorder_price 

  def price
    if preorder? && !released?
      return preorder_price
    elsif released?
      return price
    end
  end

  def released?
    !release_date.nil? && Time.now > release_date
  end

end
