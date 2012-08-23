#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require frontend/plugins/jquery.jplayer.min.js
#= require frontend/plugins/circle.player.js
#= require jquery.pjax
#= require frontend/plugins/jquery.cookie
#= require frontend/plugins/jquery.backstretch
#= require frontend/plugins/bootstrap
#= require plugins/projekktor-1.1.00r107.min
#= require plugins/jquery.nivo.slider.pack
#= require frontend/facebook
#= require frontend/home
#= require frontend/musicplayer
#= require frontend/channels
#= require frontend/welcome
#= require frontend/sessions


$(document).on "ready pjax:success", ->

  #enable pjax
  $('.content a').pjax('[data-pjax-container]')
  $('.pjax').pjax('[data-pjax-container]')

  #disable pjax
  $(".disable-pjax").click ->
    return false
    console.log "disable pjax"

  #facebook sdk
  ((d, s, id) ->
    js = undefined
    fjs = d.getElementsByTagName(s)[0]
    return  if d.getElementById(id)
    js = d.createElement(s)
    js.id = id
    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=505364239479743"
    fjs.parentNode.insertBefore js, fjs
  ) document, "script", "facebook-jssdk"

# debugging
$(document).on "pjax:success", ->
  console.log "pjax!"
$().ready ->
  console.log "ready"
