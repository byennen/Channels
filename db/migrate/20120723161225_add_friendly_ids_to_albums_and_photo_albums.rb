class AddFriendlyIdsToAlbumsAndPhotoAlbums < ActiveRecord::Migration
  def change
    add_column :photo_albums, :slug, :string
    add_column :albums, :slug, :string

    add_index :photo_albums, :slug
    add_index :albums, :slug

    PhotoAlbum.all.each { |pa| pa.save! }
    Album.all.each { |a| a.save! }
  end
end
