class AddPhotoAlbumIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :photo_album_id, :integer
  end
end
