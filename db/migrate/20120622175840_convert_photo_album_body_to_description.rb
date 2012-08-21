class ConvertPhotoAlbumBodyToDescription < ActiveRecord::Migration
  def up
    rename_column :photo_albums, :body, :description
  end

  def down
    rename_column :photo_albums, :description, :body
  end
end
