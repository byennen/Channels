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

  #hide music player - (we need to show the player on the homepage if some plays a song, so this code doesn't really work... the channel might be 0)
  window.player = new Player(el: "#player .container")
  if window.channel_id > 0
    $("header").css('height', '82px')
  else
    $("#player").hide()

  #first time visitors should see a modal window to guide them to connecting with facebook
  domain = window.location.hostname.replace /([a-zA-Z0-9]+.)/, ""
  if $.cookie("altimarc-first-time-visitor")
    $('#first_time_vistor').modal('hide')
  else
    $('#first_time_vistor').modal('show')
    $.cookie "altimarc-first-time-visitor", "cookie_value", { expires: 365, useLocalStorage: false, domain: domain }

  $('.play').click ->
    window.player.playSong($(this).attr("href"))
    return false

  $('.show_musicplayer').click ->
    $(this).addClass("hide_musicplayer")
    $(this).removeClass("show_musicplayer") 
    $(".navbar").animate({height: '155px'})

  $('.hide_musicplayer').click ->
    $(this).addClass("show_musicplayer")
    $(".navbar").animate({height: '5px'})


  #$(".show_musicplayer").Toggle (->
    #$("header").css height: "20px"
  #), ->
    #$("header").css height: "82px"

# debugging
$(document).on "pjax:success", ->
  console.log "pjax!"
$().ready ->
  console.log "ready"
