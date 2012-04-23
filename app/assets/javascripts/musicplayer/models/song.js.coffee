class Song extends Spine.Model
  @configure "Song", "filename", "title"
  @extend Spine.Model.Ajax

window.Song = Song
