$().ajaxComplete ->
  VideoJS.setupAllWhenReady()

  _V_("randy-owen-coming-soon").ready ->
    myPlayer = this
    myPlayer.width(980)
    myPlayer.height(551)
    myPlayer.play()

