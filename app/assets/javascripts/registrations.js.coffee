$().ajaxComplete ->
  $("#coupon_code").hide()
  $("a#coupon_link").click ->
    $("#coupon_code").show()

$(document).ready ->
  $("#coupon_code").hide()
  $("a#coupon_link").click ->
    $("#coupon_code").show()
