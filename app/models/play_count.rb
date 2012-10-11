class PlayCount < ActiveRecord::Base
  attr_accessible :plays, :playable_id, :playable_type, :played_on

  belongs_to :playable, :polymorphic => true

end
