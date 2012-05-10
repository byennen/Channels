class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :channel_id
      t.string :title
      t.text :description
      t.string :image_uid
      t.boolean :active
      t.timestamps
    end
  end
end
