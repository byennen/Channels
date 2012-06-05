class Content < ActiveRecord::Base
  belongs_to :contentable, polymorphic: true
  
  attr_accessible :date, :description, :end_time, :link, :location, :logo_uid, :start_time, :title
end
