class Giveaway < ActiveRecord::Base

  validates :email, :presence => true, 
                      :length => {:minimum => 3, :maximum => 254, :message => "Email is to short"},
                      :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Email is invalid"}
end
