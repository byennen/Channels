class Song extends Spine.Model
  @configure "Song", "filename", "title"
  @extend Spine.Model.Ajax

  nextSong: ->
    response = $.getJSON("/songs/next_song.json", (data)->
      return data
    )
    if response.status is not 200
      console.log "Error retrievieving new songs"

window.Song = Song
