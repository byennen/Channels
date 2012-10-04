class Album < ActiveRecord::Base

  belongs_to :channel
  has_many :songs

  attr_accessible :id, :channel_id, :title, :description, :image, :channel, 
                  :active, :price, :publish_at, :preorder, :preorder_price,
                  :release_date

  validates :title, :presence => true
  validates :description, :presence => true
  validates :image, :presence => true
  validates :price, :presence => true
  validates :publish_at, :date => { :before => Time.now + 1.year }
  validates :release_date, :date => { :after => :publish_at}


  image_accessor :image

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  money :price
  money :preorder_price 

  def current_price
    preorder? && !released? ? preorder_price : price
  end

  def current_price_in_cents
    preorder? && !released? ? preorder_price_in_cents : price_in_cents
  end

  def released?
    !release_date.nil? && Time.now > release_date
  end

end
