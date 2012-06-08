class AddSongsPreviewToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :preview, :string
    add_column :songs, :song, :string
  end
end
