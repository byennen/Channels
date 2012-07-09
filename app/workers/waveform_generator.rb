class WaveformGenerator

  @queue = :waveform_queue

  def self.perform(song_id)
    # Get the song
    song = Song.find(song_id)
    song.generate_waveform
  end

end
