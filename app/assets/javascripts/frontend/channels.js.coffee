$(document).on "ready pjax:success", ->
  $("#details").hide()
  $("#details_link").click ->
    $("#details").toggle()

