#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require jquery.pjax
#= require musicplayer
#= require_tree .

$ ->
  $('a').pjax('[data-pjax-container]')
