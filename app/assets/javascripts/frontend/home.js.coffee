$(document).on "ready pjax:success", ->
  $("#whats_new .carousel-inner .item").first().addClass "active"
  $("#latest_music .carousel-inner .item").first().addClass "active"
  $("#latest_videos .carousel-inner .item").first().addClass "active"
  
  # $(".slidedeck").slidedeck
  #   autoPlay: false
  #   cycle: true
  #   autoPlayInterval: 0
  # 
  # $(".carousel").carousel interval: 4000