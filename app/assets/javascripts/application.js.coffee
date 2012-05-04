#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require jquery.pjax
#= require musicplayer
#= require registrations
#= require plugins/jquery.cookie
#= require plugins/slideshow
#= require plugins/mosanic
#= require home

$ ->
  $('a').pjax('[data-pjax-container]')
