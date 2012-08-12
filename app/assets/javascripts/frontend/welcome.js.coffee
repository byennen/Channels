$(document).on "ready pjax:success", ->
  #payments
  #click function to check for a cookie to see if a movie has been played
  #if a movie has been played show payment form before playing anther movie
  #$(".played_video").click ->
    #$.cookie "free-video-played", "cookie_value", { expires: 365, useLocalStorage: false, domain: domain }

  #if $.cookie("free-video-played")
    #$('#payments').modal('show')
  #else
    #$('#payments').modal('hide')

  #first time visitors should see a modal window to guide them to connecting with facebook
  $('#no_facebook_signup').modal('hide')
  $("#no_facebook_btn").click ->
    $('#first_time_vistor').modal('hide')
    $.cookie "altimarc-vistor-no-facebook", "cookie_value", { expires: 365, useLocalStorage: false, domain: domain }


  domain = window.location.hostname.replace /([a-zA-Z0-9]+.)/, ""
  if $.cookie("altimarc-first-time-visitor")
    $('#first_time_vistor').modal('hide')
  else
    $('#first_time_vistor').modal('show')
    $.cookie "altimarc-first-time-visitor", "cookie_value", { expires: 365, useLocalStorage: false, domain: domain }
