# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Copy the value from the button group controls


jQuery ->
  $channelsControl = $('#user_channel_id').closest('.control-group')
  $roleInput = $("input[name='user[role]']")


  $('body').on 'click', '[data-toggle=button]', (e)->
    value = $(e.target).attr('value')

    $roleInput.val value

    if value == 'channel_master'
      $("#new_user .roles").append($channelsControl)
    else
      $channelsControl.remove()

  $selectedButton = $("[data-toggle=button][value=#{$roleInput.val()}]")

  if $selectedButton.length == 0
    $channelsControl.remove()
  else
    $selectedButton.click()

