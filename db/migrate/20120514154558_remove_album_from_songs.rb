class RemoveAlbumFromSongs < ActiveRecord::Migration
  def up
    remove_column :songs, :album
    remove_column :songs, :channel_id
    remove_column :songs, :album_price
  end

  def down
    add_column :songs, :album_price, :decimal
    add_column :songs, :channel_id, :integer
    add_column :songs, :album, :string
  end
end
