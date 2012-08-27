$(document).on "ready pjax:success", ->
  $("#coupon_code").hide()
  $("a#coupon_link").click ->
    $("#coupon_code").show()
    $("a#coupon_link").hide()

  $("#payment").hide()
  $("a#subscribe").click ->
    $("#plan").hide()
    $("#payment").show()
