require 'stripe'

class User < ActiveRecord::Base
  STRIPE_PLAN_ID = 'paid_member'

  ROLES = %w[admin channel_master paid_member]
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
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :role, :channel_id, :stripe_card_token, :coupon

  validates :role, :presence => true
  validates :channel, :presence => true, :if => :channel_master?
  
  before_validation :make_paid_member!, :if => :stripe_card_token
  after_validation :process_payment, :if => :paid_member?

  private

  def process_payment
    customer = Stripe::Customer.create(:email => email, :plan => STRIPE_PLAN_ID, :card => stripe_card_token)
    self.stripe_customer_token = customer.id
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
end
