class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :channel_id
      t.string :title
      t.text :description
      t.string :short_video_uid
      t.string :full_video_uid
      t.string :image_uid
      t.boolean :paid
      t.boolean :active

      t.timestamps
    end
  end
end
