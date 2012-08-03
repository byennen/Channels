after :users, :channels do
  channel = Channel.find_by_subdomain('markcollie')

  video_img = Rails.root.join('db', 'seeds', 'assets', 'videos', 'brushy_mountain', 'mark-collie.png')
  
  puts "***CREATING POSTS***"
  (1..8).each do |i|
    Post.create(
      :channel => channel, :title => "This is a movie demo", :feature => "News", :publish_on => Time.now, :photo_id => "1",
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque hendrerit lacus eu risus porttitor eget aliquet nisl venenatis. Nulla lacus libero, molestie et vulputate id, ullamcorper sed nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis euismod malesuada turpis sodales commodo. Phasellus fermentum sapien nec lectus luctus a viverra arcu ultrices. Integer eleifend varius lorem, sit amet suscipit mi imperdiet sed. In hac habitasse platea dictumst. Suspendisse egestas, sem condimentum condimentum blandit, neque sapien adipiscing elit, sed lacinia enim lorem eget arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia."
    )
  end
  puts ""
end
