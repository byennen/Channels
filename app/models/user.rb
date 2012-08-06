require 'stripe'

class User < ActiveRecord::Base
  STRIPE_PLAN_ID = 'paid_member'

  ROLES = %w[admin channel_master paid_member unpaid_member]
  ROLES.each do |the_role|
    define_method("#{the_role}?") do
      self.role == the_role
    end

    define_method("make_#{the_role}!") do
      self.role = the_role
      self.save!
    end
  end

  belongs_to :channel

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :stripe_card_token
  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, 
                               :remember_me, :role, :channel_id, :stripe_card_token, :coupon

  validates :role, :presence => true
  validates :channel, :presence => true, :if => :channel_master?

  before_validation :add_member_role
  after_validation :process_payment, :if => :paid_member?

  #facebook login
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      if user.new_record?
        user.provider = auth.provider
        user.uid = auth.uid
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.email = auth.info.email
        #TODO - user should be asked make a password
        user.password = 'please'
        user.role = 'connected'
        user.new_fb_user = true
      end
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def facebook?
    oauth_token? && oauth_expires_at > Time.now
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
  rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil # or consider a custom null object
  end

  def put_fb_connection(user_id, method, options={})
     user = User.find(user_id)
     user.facebook.put_connections("me", method, options)
  end

  private

  def process_payment
    customer = Stripe::Customer.create(:email => email, :plan => STRIPE_PLAN_ID, :card => stripe_card_token)
    self.stripe_customer_token = customer.id
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
  
  def add_member_role
    if stripe_card_token
      self.role = 'paid_member'
    else
      self.role = 'unpaid_member'
    end
  end
  
end
