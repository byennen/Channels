$(document).on "ready pjax:success", ->
  $("#coupon_code").hide()
  $("a#coupon_link").click ->
    $("#coupon_code").show()

  $("#payment").hide()
  $("a#subscribe").click ->
    $("#plan").hide()
    $("#payment").show()
