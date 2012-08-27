$(document).on "ready pjax:success", ->
  $("#coupon_code").hide()
  $("a#coupon_link").click ->
    $("#coupon_code").show()
    $("a#coupon_link").hide()

  if $("#user_plan").val() == ""
    $("#payment").hide()
  
  $("a#subscribe").click ->
    plan = $(this).data('plan')
    $("#plan").hide()
    $("#payment").show()
    $("#user_plan").val(plan)