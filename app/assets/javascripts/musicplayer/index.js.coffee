#= require json2
#= require jquery
#= require spine
#= require spine/manager
#= require spine/ajax
#= require spine/route

#= require_tree ./lib
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_self


class Musicplayer extends Spine.Controller
  echo = console.log

  events:
    "click #player_previous": "previousTrack"
    "click #player_next":     "nextTrack"
    "click #player_play":     "playMusic"

  elements:
    "#cover-art": "coverArt"
    "#track-meta-data": "metaData"
    "#link-to-album": "albumLink"
    "#link-to_artist": "artistLink"
    "#track" : "track"

  constructor: ->
    super
    Spine.Route.setup()
    @track = $(@el).find("#track")[0]
  
  previousTrack: (event) ->
    echo "previos track clicked"

  nextTrack: (event) ->
    echo "next track clicked"

  playMusic: (event) ->
    if @track.paused
      @track.play()
      echo "Play music"
    else
      @track.pause()
      echo "Stop music"

  playNextSong: () ->
    response = $.getJSON("/songs/next_song.json", (data)=>
      echo @setSong(data["filename"])
    )

  setSong: (song_filename) ->
    echo song_filename


window.Musicplayer = new Musicplayer(el: $('#player'))
