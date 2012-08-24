module ChannelsHelper
  
  def carousel_class(videos, slice)
    if videos.first == slice.first
      return "active"
    end
  end
  
end
