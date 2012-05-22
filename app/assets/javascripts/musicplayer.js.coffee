echo = console.log

class Player
  constructor: ->
    @el = $("#player .container")
    @player = $('#jplayer')
    @player.jPlayer({
      swfPath: "/assets/",
      ready: @playNext
      ended: @playNext
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


  playEnded: (event) ->
    echo "I stopped playing"
    @playNext()

  playDummy: ->
    echo "dummy, dummy, dummy"

  playing: ->
    echo "playing..."

  playNext: ->
    response = $.getJSON("/songs/next_song.json", (data)=>
      echo "playing next song: " + data["filename"]
      $('#jplayer').jPlayer("setMedia", {
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
