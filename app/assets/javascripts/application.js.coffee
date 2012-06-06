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

$ ->
  $('a').pjax('[data-pjax-container]')
  window.player = new Player(el: "#player .container")
  
  # login dropdown
  $("#login-trigger").click ->
    $(this).next("#login-content").slideToggle()
    $(this).toggleClass "active"
    if $(this).hasClass("active")
      $(this).find("span").html "&#x25B2;"
    else
      $(this).find("span").html "&#x25BC;"
