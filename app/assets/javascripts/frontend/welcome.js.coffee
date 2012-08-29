$(document).on "ready pjax:success", ->

  #set domain for cookies
  domain = window.location.hostname.replace /([a-zA-Z0-9]+.)/, ""

  #check for admin
  if admin = $("meta[name=\"admin\"]").attr("content")
    console.log admin

  #check for unpaid members
  if user_connected = $("meta[name=\"user_connected\"]").attr("content")
    console.log user_connected
    #$('#payments').modal('show')
  #save a cookie if they dont have facebook
  $("#no_facebook_btn").click ->
    $('#first_time_vistor').modal('hide')
    $('#no_facebook_signup').modal('show')
    console.log("should have opened the new modal")
    $.cookie "altimarc-vistor-no-facebook", "cookie_value", { expires: 365, useLocalStorage: false, domain: domain }

  #check for paid member
  if paid_member = $("meta[name=\"paid_member\"]").attr("content")
    console.log paid_member


  #unpaid member - photos warnings
  $('.unpaid_member_photos').click ->
    $('#unpaid_members_photos_modal').modal('show')

  #unpaid member - music warnings
  $('.unpaid_members_music').click ->
    $('#unpaid_members_music_modal').modal('show')

  #unpaid member - video warning
  $('.unpaid_members_videos').click ->
    $('#unpaid_members_videos_modal').modal('show')

  $('.coming_soon').click ->
    $('#coming_soon_modal').modal('show')
    
  $('.connected').click ->
    if not_connected = $("meta[name=\"user_not_connected\"]").attr("content")
      $("#first_time_vistor").modal('show')  
      return false

  #unpaid member -> wants to join
  #$(".become_a_member").click ->
    #console.log "Become a member!"
    #$('.modal-backdrop').hide()
    

