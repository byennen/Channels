class AddPublishAtToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :publish_at, :datetime
    add_column :songs, :publish_at, :datetime
  end
end
