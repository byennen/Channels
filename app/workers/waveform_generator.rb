class WaveformGenerator

  @queue = :waveform_queue

  def self.perform(method, *args)
    self.send(method, *args)
  end
  
  def self.song_waveform(options={})
    # Get the song
    song = Song.find(options["song_id"])
    song.generate_waveform
  end
  
  def self.preview_waveform(options={})
    song = Song.find(options["song_id"])
    song.generate_waveform(true)
  end
  
end
