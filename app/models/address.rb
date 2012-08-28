class Address < ActiveRecord::Base
  
  attr_accessible :address, :address2, :city, :state, :zip_code
  
  belongs_to :user
  
end
