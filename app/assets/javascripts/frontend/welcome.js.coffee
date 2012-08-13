$(document).on "ready pjax:success", ->

  #set domain for cookies
  domain = window.location.hostname.replace /([a-zA-Z0-9]+.)/, ""

  if admin = $("meta[name=\"admin\"]").attr("content")
    console.log admin
    $('#first_time_vistor').modal('hide')
    $('#no_facebook_signup').modal('hide')
    $('#payments').modal('hide')

  #check for unpaid members
  if user_connected = $("meta[name=\"user_connected\"]").attr("content")
    console.log user_connected
    $('#payments').modal('show')
    $('#first_time_vistor').modal('hide')
    $('#no_facebook_signup').modal('hide')
  else
    #welcome first time visitors
    $('#first_time_vistor').modal('show')
    #confirm user sign up isnt showing
    $('#no_facebook_signup').modal('hide')
    #save cookie if a user doesnt have facebook
    $("#no_facebook_btn").click ->
      $('#first_time_vistor').modal('hide')
      $.cookie "altimarc-vistor-no-facebook", "cookie_value", { expires: 365, useLocalStorage: false, domain: domain }

  #check for paid member
  if paid_member = $("meta[name=\"paid_member\"]").attr("content")
    console.log paid_member
