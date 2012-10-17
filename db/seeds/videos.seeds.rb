after :users, :channels do
  channel = Channel.find_by_subdomain('aliveatbrushy')

  video_img = Rails.root.join('db', 'seeds', 'assets', 'videos', 'brushy_mountain', 'mark-collie.png')
  video_dir = Rails.root.join('db', 'seeds', 'assets', 'videos')

  puts "***CREATING VIDEOS***"

  (1..4).each do |i|
    Video.create(
      :channel => channel, :title => "This is a movie demo making this title longer so I can test", :image => video_img, :publish_on => 1.day.ago, 
      #:video => File.new(File.join(video_dir, "intro.mp4")),
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque hendrerit lacus eu risus porttitor eget aliquet nisl venenatis. Nulla lacus libero, molestie et vulputate id, ullamcorper sed nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis euismod malesuada turpis sodales commodo. Phasellus fermentum sapien nec lectus luctus a viverra arcu ultrices. Integer eleifend varius lorem, sit amet suscipit mi imperdiet sed. In hac habitasse platea dictumst. Suspendisse egestas, sem condimentum condimentum blandit, neque sapien adipiscing elit, sed lacinia enim lorem eget arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia."
    )
  end

  puts ""
end
