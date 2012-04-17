class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :channel_id
      t.string :title
      t.string :album
      t.decimal :song_price
      t.decimal :album_price

      t.timestamps
    end
  end
end
