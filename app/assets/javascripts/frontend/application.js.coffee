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

  #musicplayer
  window.player = new Player(el: "#player .container")

  $('.play').click ->
    window.player.playSong($(this).attr("href"))
    return false

  #first time visitors should see a modal window to guide them to connecting with facebook
  domain = window.location.hostname.replace /([a-zA-Z0-9]+.)/, ""
  if $.cookie("altimarc-first-time-visitor")
    $('#first_time_vistor').modal('hide')
  else
    $('#first_time_vistor').modal('show')
    $.cookie "altimarc-first-time-visitor", "cookie_value", { expires: 365, useLocalStorage: false, domain: domain }

# debugging
$(document).on "pjax:success", ->
  console.log "pjax!"
$().ready ->
  console.log "ready"
