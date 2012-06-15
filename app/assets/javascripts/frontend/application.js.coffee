#= require jquery
#= require jquery_ujs
#= require frontend/plugins/jquery.jplayer.min.js
#= require frontend/plugins/circle.player.js
#= require twitter/bootstrap
#= require jquery.pjax
#= require_tree .



$(document).on "ready pjax:success", ->
  $('.content a').pjax('[data-pjax-container]')
  $('.pjax').pjax('[data-pjax-container]')


# debugging
$(document).on "pjax:success", ->
  console.log "pjax!"
$().ready ->
  console.log "ready"

$().ready ->
  if window.channel_id > 0
    window.player = new Player(el: "#player .container")
  else
    $("#player").hide()
