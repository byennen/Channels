echo = console.log

class Player

  status: false
  playCount: 0
  intro: true

  constructor: (@player, @el)->
    @player = $('#jplayer')
    @player.jPlayer({
      swfPath: "/assets/",
      ready: @setNext
      ended: @playNext
      play: @playing
      error: (event) ->
        console.log(event.jPlayer.error.type)
      playing: @playing
      timeupdate: (event) ->
        @status = event.jPlayer.status.paused
    })
    el = $("#player")
    el.find("#cover-art").click(@play)

  playEnded: (event) ->
    echo "I stopped playing"
    @status = false
    @playNext()

  playing: ->
    console.log("playing...")
    $("#player").animate({height: '93px'})
    $("body").animate({'margin-top': '142px'})

  setClass: (name, className)->
    el = $("#player").find(className)
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

  #playNext: =>
    #@setNext()
    #setTimeout('$("#jplayer").jPlayer("play")', 500)

  #setNext: =>
    #@playCount++
    #echo @playCount
    #if channel_id > 0
      #url = "/channels/next_song.json"
    #else
      #url = "/songs/next_song.json"
    #if @playCount > 3
      #url = "/ads/next.json"
      #@playCount = 0
    #r = $.getJSON(url, (data)->
      #$('#jplayer').jPlayer("setMedia", {
        #mp3: data["filename"]
      #})
      #player.setClass(data["title"], ".trackName")
      #player.setClass(data["album"], ".artist")
      #player.status = true
    #)

  playprevious: ->
    echo "What am I supposed to play now?"

  play: ->
    if @status
      $("#jplayer").jPlayer("play")
      $("#cover-art").addClass("playing").removeClass("paused")
      @status = false
    else
      $("#jplayer").jPlayer("pause")
      $("#cover-art").addClass("paused").removeClass("playing")
      @status = true

  updateInfo: (data) ->
    $(".artist").html(data['artist_name'])
    $(".trackName").html(data['title'])
    $("#cover-art a img").attr("src", data['album_image'])
    $("#waveform img").attr("src", data["waveform"])

  playSong: (url) ->
    status = $('meta[name="user_connected"]').attr('content')
    r = $.getJSON(url, (data) ->
      if status == "paid member"
        @url = data["url"]
      else
        @url = data["preview_url"]
      $('#jplayer').jPlayer("setMedia", {
        mp3: url
      }).jPlayer("play")
      player.setClass("Welcome", ".title")
      player.setClass("", ".album")
      @status = true
      @intro = false
      $("#cover-art").addClass("paused").removeClass("playing")
      player.updateInfo(data)
      $.post("/songs/" + data["id"] + "/played", (data) ->
        played = data
      )
    )


window.Player = Player
