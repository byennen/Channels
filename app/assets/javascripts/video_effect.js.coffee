$().ready ->
  if $.cookie("randy-owen-coming-soon")
    $(".fader").mosaic()
  else
    $("#video").show()
    $(".navbar").hide()
    $(".background-wrapper").hide()
    $("html, body").css
      "background-image": "none"
      "background-color": "#000"
      "width": "100%"
      "height": "100%"

    _V_("randy-owen-coming-soon").ready ->
      myPlayer = this
      myPlayer.width(980)
      myPlayer.height(551)
      myPlayer.buffered(50)
      myPlayer.play()

      @addEvent "ended", ->
        $("#video").fadeOut 100
        $(".navbar").delay(100).fadeIn 2000
        $(".background-wrapper").delay(500).fadeIn 2000
        $("html, body").css
          "background-image": "none"
          "background-color": "#ededed"
          "width": "100%"
          "height": "100%"
        $.cookie "randy-owen-coming-soon", "cookie_value", { expires: 365, useLocalStorage: false }
