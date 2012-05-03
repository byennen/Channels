#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require jquery.pjax
#= require jQuery.jPlayer.2.1.0/jquery.jplayer.min.js
#= require musicplayer
#= require registrations
#= require plugins/jquery.cookie
#= require plugins/mosanic

$ ->
  $('a').pjax('[data-pjax-container]')
