class LineItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :purchasable, :polymorphic => true

  scope :album, where(:purchasable_type => 'Album')
  scope :song, where(:purchasable_type => 'Song')

end

