echo = console.log

class Player
  constructor: ->
    @el = $("#player .container")
    @player = $('#jplayer')
    @player.status = ""
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
        echo event.jPlayer.error.type
      playing: ->
        echo "playing....."
      canplay: ->
        echo "I can play all day"
      timeupdate: (event) ->
        @player.status event.jPlayer.status.paused
    })
    @el.find("#controls a#player_play").click(@play)


  playEnded: (event)->
    echo "I stopped playing"
    @playNext()
    return false

  playing: ->
    echo "playing..."

  playNext: ->
    echo "playing next song..." + @player.status
    response = $.getJSON("/songs/next_song.json", (data)=>
      echo data["filename"]
      @player.jPlayer("setMedia", {
        mp3: "/assets/" + data["filename"]
      }).jPlayer("play")
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
