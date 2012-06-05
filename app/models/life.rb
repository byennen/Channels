class Life < ActiveRecord::Base
  belongs_to :channel
  has_many :contents, as: :contentable
  
  attr_accessible :channel
end
