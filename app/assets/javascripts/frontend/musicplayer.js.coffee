echo = console.log

class Player

  status: false
  playCount: 0
  intro: true

  constructor: (@player, @el)->
    @player = $('#jplayer')
    @player.jPlayer({
      swfPath: "/assets/",
      ready: @playNext
      ended: @playNext
      play: @playing
      error: (event) ->
        console.log(event.jPlayer.error.type)
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
    console.log("playing...")

  setClass: (name, className)->
    el = $("#player .container").find(className)
    el.attr("title", name)
    el.text(name)

  playIntro: ->
    r = $.getJSON("/songs/intro.json", (data)->
        $('#jplayer').jPlayer("setMedia", {
          mp3: "/assets/" + data["filename"]
        }).jPlayer("play")        
        player.setClass("Welcome", ".title")
        player.setClass("", ".album")
        player.status = true
        player.intro = false
      )

  playNext: =>
    if channel_id > 0
      url = "/channels/next_song.json"
    else 
      url = "/songs/next_song.json"
    r = $.getJSON(url, (data)->
      $('#jplayer').jPlayer("setMedia", {
        mp3: data["filename"]
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
