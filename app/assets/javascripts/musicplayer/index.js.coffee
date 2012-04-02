#= require json2
#= require jquery
#= require spine
#= require spine/manager
#= require spine/ajax
#= require spine/route

#= require_tree ./lib
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views

class Musicplayer extends Spine.Controller

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
  
  previousTrack: (event) ->
    console.log "previos track clicked"

  nextTrack: (event) ->
    console.log "next track clicked"

  playMusic: (event) ->
    console.log @track
    #@track.play()
    console.log "play music now"

window.Musicplayer = new Musicplayer(el: $('#player'))
