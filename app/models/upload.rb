class Upload < ActiveRecord::Base
  belongs_to :uploadable, polymorphic: true
  
  attr_accessible :file_name, :file_size, :file_type
end
