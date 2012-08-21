class CreatePhotoAlbums < ActiveRecord::Migration
  def change
    create_table :photo_albums do |t|
      t.column :channel_id, :integer
      t.column :title, :string
      t.column :body, :text
      t.timestamps
    end
  end
end
