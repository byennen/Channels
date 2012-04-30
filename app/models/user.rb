class User < ActiveRecord::Base
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

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :role, :channel_id

  validates :role, :presence => true
  validates :channel, :presence => true, :if => :channel_master?
end
