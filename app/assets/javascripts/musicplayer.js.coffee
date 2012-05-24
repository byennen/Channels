echo = console.log

class Player

  status: false

  constructor: (@player, @el)->
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
    el = $("#player .container")
    el.find("#controls a#player_play").click(@play)
    el.find("#controls a#player_next").click(@playNext)
    el.find("#controls a#player_previous").click(@playPrevious)

  playEnded: (event) ->
    echo "I stopped playing"
    @status = false
    @playNext()

  playing: ->
    echo "playing..."

  setClass: (name, className)->
    artistEl = $("#player .container").find(className)
    artistEl.attr("title", name)
    artistEl.text(name)

  playNext: ->
    response = $.getJSON("/songs/next_song.json", (data)->
      echo "playing next song: " + data["filename"]
      $('#jplayer').jPlayer("setMedia", {
        mp3: "/assets/" + data["filename"]
      }).jPlayer("play")
      player.setClass(data["title"], ".trackName")
      player.setClass(data["album"], ".artist")
      player.status = true
    )

  playPrevious: ->
    echo "What am I supposed to play now?"

  play: ->
    if @status
      $("#jplayer").jPlayer("play")
      $("#controls a#player_play").addClass("playing").removeClass("paused")
      @status = false
    else
      $("#jplayer").jPlayer("pause")
      $("#controls a#player_play").addClass("paused").removeClass("playing")
      @status = true

window.Player = Player
