$(document).on "ready pjax:success", ->

  $("#coupon_code").hide()
  $("a#coupon_link").click ->
    $("#coupon_code").show()
    $("a#coupon_link").hide()

  console.log("user plan is " + $("#user_plan").val())
  if $("#user_plan").val() == ""
    $("#payment").hide()
    $("#address").hide()
  
  $("a#subscribe").click ->
    plan = $(this).data('plan')
    $("#plan").hide()
    $("#payment").show()
    $("#actions").show()
    $("#user_plan").val(plan)
    console.log("Plan is " + plan)
    if plan == "695"
      $("#address").hide()
