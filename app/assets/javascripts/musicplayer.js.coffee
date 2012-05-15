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
      ended: @playEnded
      play: @playing
      error: (event) ->
        echo event
    })
    @el.find("#controls a#player_play").click(@play)

  playEnded: (event)->
    echo "I stopped playing"
    @playNext()
    return false

  playing: ->
    echo "playing..."

  playNext: ->
    echo "playing next song..."
    response = $.getJSON("/songs/next_song.json", (data)=>
      @player.jPlayer("setMedia", {
        mp3: data["filename"]
      })
      @player.jPlayer("play")
    )

  setSong: (song_filename) ->
    echo song_filename

  play: ->
    @player.jPlayer("play")
    echo "play music..."

  pause: ->
    @player.jPlayer("pause")
    echo "pausing play"

window.Player = Player
