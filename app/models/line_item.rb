class LineItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :song

end

