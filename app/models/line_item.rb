class LineItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :purchasable, :polymorphic => true

end

