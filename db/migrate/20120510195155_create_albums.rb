class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :channel_id
      t.string :title
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2
      t.string :image_uid
      t.boolean :active
      t.timestamps
    end
  end
end
