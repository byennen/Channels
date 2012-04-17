class Giveaway < ActiveRecord::Base

  validates :email, :presence => true, 
                      :length => {:minimum => 3, :maximum => 254, :message => "Email is to short"},
                      :uniqueness => {:scope => :cma, :scope => :derby, :message => "Email needs to be unique per giveaway. Feel free to Register as many emails as you want!"},
                      :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Email is invalid"}
end
