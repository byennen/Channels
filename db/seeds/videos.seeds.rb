after :users, :channels do
  channel = Channel.find_by_subdomain('markcollie')
  
  puts "***CREATING VIDEOS***"
  video = Video.create(:channel => channel, :title => "This is a movie demo", :description => "Description")
  puts ""
end
