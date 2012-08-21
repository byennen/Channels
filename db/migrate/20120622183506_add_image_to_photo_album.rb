class AddImageToPhotoAlbum < ActiveRecord::Migration
  def up
    add_column :photo_albums, :image_uid, :string
  end
  
  def down
    remove_column :photo_albums, :image_uid
  end
  
end
