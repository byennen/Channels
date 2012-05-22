echo = console.log

class Player
  constructor: ->
    @el = $("#player .container")
    @status = false
    @player = $('#jplayer')
    @player.jPlayer({
      swfPath: "/assets/",
      ready: @playNext
      ended: @playNext
      play: @playing
      error: (event) ->
        echo event.jPlayer.error.type
      playing: @playing
      timeupdate: (event) ->
        @status = event.jPlayer.status.paused
    })
    @el.find("#controls a#player_play").click(@play)
    @el.find("#controls a#player_next").click(@playNext)
    @el.find("#controls a#player_previous").click(@playPrevious)

  playEnded: (event) ->
    echo "I stopped playing"
    @status = false
    @playNext()

  playing: ->
    echo "playing..."

  playNext: ->
    response = $.getJSON("/songs/next_song.json", (data)=>
      echo "playing next song: " + data["filename"]
      $('#jplayer').jPlayer("setMedia", {
        mp3: "/assets/" + data["filename"]
      }).jPlayer("play")
      @status = true
    )

  playPrevious: ->
    echo "What am I supposed to play now?"

  play: ->
    if @status
      $("#jplayer").jPlayer("play")
      @status = false
      echo "play music..."
    else
      $("#jplayer").jPlayer("pause")
      @status = true
      echo "pause music..."

window.Player = Player
