echo = console.log

class Player
  constructor: ->
    @el = $("#player .container")
    @player = $('#jplayer')
    @player.jPlayer({
      swfPath: "/assets/",
      ready: (event) ->
            $(@).jPlayer("setMedia", {
                mp3: "/assets/song.mp3"
            })
            $(@).jPlayer("play")
    })
    @player.bind($.jPlayer.event.ended + ".jp-repeat", @playEnded)
    @player.bind($.jPlayer.event.play + ".jp-repeat", @playint)
    @el.find("#controls a#player_play").click(@play)

  playEnded: ->
    echo "I stopped playing"
    @playNext

  playing: ->
    echo "playing..."

  playNext: ->
    echo "playing next song..."
    response = $.getJSON("/songs/next_song.json", (data)=>
      @player.jPlayer("setMedia", {
        mp3: @setSong(data["filename"])
      })
      @player.jPlayer("play")
    )

  play: ->
    @player.jPlayer("play")
    echo "play music..."

  pause: ->
    echo "pausing play"

window.Player = Player
