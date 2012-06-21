jQuery ->
  $('#post_feature').change (event) ->
    $('.event').hide();
    $('.giving').hide();
    $feature = $(this).val()
    console.log("Feature is " + $feature)
    if $feature == 'Event'
      $('.event').show();
    else if $feature == 'Giving'
      $('.event').show();
      $('.giving').show();