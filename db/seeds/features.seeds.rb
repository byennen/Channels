after :users, :channels do
  randyowen = Channel.find_by_subdomain("randyowen")
  markcollie = Channel.find_by_subdomain('markcollie')
  samphillips = Channel.find_by_subdomain('samphillips')
  
  puts "***CREATING CHANNEL FEATURES**"

  Feature.find(randyowen).update_attributes(:channel => randyowen, :news => "1", :events => "1")
  Feature.find(markcollie).update_attributes(:channel => markcollie, :news => "1", :events => "1", :giving => "1", :vault => "1")
  Feature.find(samphillips).update_attributes(:channel => samphillips, :news => "1", :events => "1")

  puts ""
end
