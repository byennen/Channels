jQuery ->
  $('#post_feature').change (event) ->
    $('.news').hide()
    $('.publish_date').hide()
    $('.event').hide()
    $('.giving').hide()
    $feature = $(this).val()
    if $feature != ""
      $('.news').show();
      $('.publish_date').show();
    if $feature == 'Event'
      $('.event').show();
    else if $feature == 'Giving'
      $('.event').show();
      $('.giving').show();