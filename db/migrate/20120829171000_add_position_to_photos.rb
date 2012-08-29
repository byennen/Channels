class AddPositionToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :position, :integer
    PhotoAlbum.all.each do |pa|
      i = 1
      pa.photos.each do |p|
        p.position = i
        i += 1
      end
    end
  end
end
