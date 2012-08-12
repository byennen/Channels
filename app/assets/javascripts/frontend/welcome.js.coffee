$(document).on "ready pjax:success", ->

  #set domain for cookies
  domain = window.location.hostname.replace /([a-zA-Z0-9]+.)/, ""

  if admin = $("meta[name=\"admin\"]").attr("content")
    console.log admin
    $('#first_time_vistor').modal('hide')
    $('#no_facebook_signup').modal('hide')
    $('#payments').modal('hide')


  #check meta tags
  if user_connected = $("meta[name=\"user_connected\"]").attr("content")
    console.log user_connected
    $('#first_time_vistor').modal('hide')
    $('#no_facebook_signup').modal('hide')
  else
    #welcome to first time visitors
    $('#first_time_vistor').modal('show')
    #confirm user sign up isnt showing
    $('#no_facebook_signup').modal('hide')
    #save cookie if a user doesnt have facebook
    $("#no_facebook_btn").click ->
      $('#first_time_vistor').modal('hide')
      $.cookie "altimarc-vistor-no-facebook", "cookie_value", { expires: 365, useLocalStorage: false, domain: domain }

  if paid_member = $("meta[name=\"paid_member\"]").attr("content")
    console.log paid_member

  #else
    #if $.cookie("free-video-played")
      #$('#payments').modal('show')
    #else
      #$('#payments').modal('hide')
  
  ##save cookie if video is played
  #$(".played_video").click ->
    #$.cookie "free-video-played", "cookie_value", { expires: 365, useLocalStorage: false, domain: domain }



  #payments
  #click function to check for a cookie to see if a movie has been played
  #if a movie has been played show payment form before playing anther movie

  #if $.cookie("free-video-played")
    #$('#payments').modal('show')
  #else
    #$('#payments').modal('hide')


  #first time visitors should see a modal window to guide them to connecting with facebook
  #$('#no_facebook_signup').modal('hide')
  #if $.cookie("altimarc-vistor-no-facebook")
    #$('#no_facebook_signup').modal('hide')
  #$("#no_facebook_btn").click ->
    #$('#first_time_vistor').modal('hide')
    #$.cookie "altimarc-vistor-no-facebook", "cookie_value", { expires: 365, useLocalStorage: false, domain: domain }


  #domain = window.location.hostname.replace /([a-zA-Z0-9]+.)/, ""
  #if $.cookie("altimarc-first-time-visitor")
    #$('#first_time_vistor').modal('hide')
  #else
    #$('#first_time_vistor').modal('show')
    #$.cookie "altimarc-first-time-visitor", "cookie_value", { expires: 365, useLocalStorage: false, domain: domain }
