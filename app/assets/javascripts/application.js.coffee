#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require jquery.pjax
#= require musicplayer
#= require_tree .

jQuery ->
  $('a').pjax('[data-pjax-container]')

