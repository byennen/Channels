#= require jquery
#= require jquery_ujs
#= require frontend/plugins/jquery.jplayer.min.js
#= require frontend/plugins/circle.player.js
#= require twitter/bootstrap
#= require jquery.pjax
#= require_tree .



$(document).on "ready pjax:success", ->
  #enable pjax
  $('.content a').pjax('[data-pjax-container]')
  $('.pjax').pjax('[data-pjax-container]')

  #hide music player - (we need to show the player on the homepage if some plays a song, so this code doesn't really work... the channel might be 0)
  if window.channel_id > 0
    window.player = new Player(el: "#player .container")
    $("header").css('height', '82px')
  else
    $("#player").hide()

# debugging
$(document).on "pjax:success", ->
  console.log "pjax!"
$().ready ->
  console.log "ready"
