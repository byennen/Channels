$(document).on "ready pjax:success", ->
  $("#coupon_code").hide()
  $("a#coupon_link").click ->
    $("#coupon_code").show()

  stripeHandler = new StripeHandler
  $('#subscribe_user').submit stripeHandler.handleSubmit

class StripeHandler
  constructor: ->
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))

  handleSubmit: (e)=>
    e.preventDefault()
    $('input[type=submit]').attr 'disabled', true
    @processCard()

  processCard: =>
    card =
      number:    $('#card_number').val()
      cvc:       $('#security_code').val()
      expMonth:  $('#card_month').val()
      expYear:   $('#card_year').val()
    Stripe.createToken card, @handleStripeResponse

  handleStripeResponse: (status, response)=>
    @clearErrors()
    if status == 200
      $('#user_stripe_card_token').val response.id
      $form = $('#subscribe_user')

      $.post($form.attr("action") 
             $form.serialize()
             (data) ->
               console.log("success")
               $('.payment_form').hide()
               $('.thank_you').show()
      )
    else
      @renderErrors(response.error)
      $('input[type=submit]').attr 'disabled', false

  renderErrors: (error)=>
    errorSpan = $('<span>')
      .addClass('help-inline')
      .text(error.message)
      .css('display', 'block')

    switch error.code
      when 'invalid_number', 'incorrect_number', 'expired_card', 'card_declined'
        errorClass = 'credit_card'
      when 'invalid_expiry_month', 'invalid_expiry_year', 'expired_card'
        errorClass = 'card_expiration'
      when 'invalid_cvc', 'incorrect_cvc'
        errorClass = 'security_code'
      else
        errorClass = 'credit_card'

    $(".control-group.#{errorClass}")
      .addClass('error')
      .find('.controls')
        .append(errorSpan)

  clearErrors: =>
    $('.payment .control-group.error')
      .removeClass('error')
      .find('.controls .help-inline')
      .remove()
