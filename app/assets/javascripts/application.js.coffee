#= require jquery
#= require jquery_ujs
#= require plugins/jquery.jplayer.min.js
#= require plugins/circle.player.js
#= require twitter/bootstrap
#= require jquery.pjax
#= require plugins/jquery.cookie
#= require plugins/slideshow
#= require plugins/mosanic
#= require home
#= require musicplayer

$(document).on "ready pjax:success", ->
  $('.content a').pjax('[data-pjax-container]')
  $('.pjax').pjax('[data-pjax-container]')
  window.player = new Player(el: "#player .container")
  $().ready(login)

# login dropdown
login = ->
  $("#login-trigger").click ->
    $(this).attr('[data-pjax-container]')
    $(this).next("#login-content").slideToggle()
    $(this).toggleClass "active"
    if $(this).hasClass("active")
      $(this).find("span").html "&#x25B2;"
    else
      $(this).find("span").html "&#x25BC;"


# debugging
$(document).on "pjax:success", ->
  console.log "pjax!"
$().ready ->
  console.log "ready"