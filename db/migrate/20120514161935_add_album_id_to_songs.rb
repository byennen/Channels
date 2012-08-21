class AddAlbumIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :album_id, :integer
    add_column :songs, :price, :decimal, :precision => 8, :scale => 2
  end
end
