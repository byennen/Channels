#= require jquery
#= require jquery_ujs
#= require plugins/jquery.jplayer.min.js
#= require plugins/circle.player.js
#= require twitter/bootstrap
#= require jquery.pjax
#= require registrations
#= require plugins/jquery.cookie
#= require plugins/slideshow
#= require plugins/mosanic
#= require home
#= require musicplayer

$ ->
  $('a').pjax('[data-pjax-container]')
  window.player = new Player(el: "#player .container")
