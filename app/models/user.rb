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
  has_one :address
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :stripe_card_token, :plan
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, 
                               :remember_me, :role, :channel_id, :stripe_card_token, 
                               :coupon, :plan, :address_attributes

  validates :role, :presence => true
  validates :channel, :presence => true, :if => :channel_master?

  before_validation :add_member_role, :on => :create
  after_validation :process_payment, :if => :stripe_card_token
  after_create :send_welcome_email

  accepts_nested_attributes_for :address
  
  #facebook login
  def self.from_omniauth(auth)
    if user = find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
      return user
    else
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.email = auth.info.email
        #TODO - user should be asked make a password
        user.password = 'please'
        user.role = 'connected'
        user.new_fb_user = true
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)   
        user.save!  
        return user     
      end
    end
  end

  def facebook?
    oauth_token? && oauth_expires_at > Time.now
  end
  
  def paid_member?
    !stripe_customer_token.nil? && !stripe_plan.nil?
  end
  
  def unpaid_member?
    !paid_member?
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
  rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil # or consider a custom null object
  end

  def self.put_fb_connection(user_id, method, options={})
     user = User.find(user_id)
     user.facebook.put_connections("me", method, options)
  end

  def cancel_membership
    if paid_member?
      customer = Stripe::Customer.retrieve(stripe_customer_token)
      customer.cancel_subscription
      update_attribute(:stripe_plan, nil)
    end
  end
  
  private

  def process_payment
    p = plan == "695" ? "basic" : "plus"
    customer = Stripe::Customer.create(:email => email, :plan => p, :card => stripe_card_token)
    self.stripe_customer_token = customer.id
    self.stripe_plan = p
    if plan != "695"
      case plan
      when "1195"
        amount = 1195
        description = "cd, t-shirt, one month free"
      when "1995"
        amount = 1995
        description = "t-shirt vinyle, one free month"
      when "2495"
        amount = 2495
        description = "t-shirt, vinyl, cd, one free month"
      end
      Stripe::Charge.create(
          :amount => amount,
          :currency => "usd",
          :customer => customer.id,
          :description => "Charge for #{email} - #{description}"
      )
    end
    Resque.enqueue(MemberWorker, :send_subscribed, {"user_id" => self.id, 
                                                    "amount" => amount,
                                                    "description" => description})
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  rescue Stripe::CardError => e
    logger.error "Stripe error for card"
    errors.add :base, "There was a problem with your credit card"
  end
  
  def add_member_role
    if self.role.blank?
      if stripe_card_token 
        self.role = 'paid_member'
      else
        self.role = 'unpaid_member'
      end
    end
  end
  
  def send_welcome_email
    unless new_fb_user?
      Resque.enqueue(MemberWorker, :send_welcome, {"user_id" => self.id})
    end
  end
  
end
