class CreateVideoPreviews < ActiveRecord::Migration
  def change
    create_table :video_previews do |t|
      t.integer :video_id
      t.string  :video
      t.string  :zencoder_output_id
      t.boolean :processed
      t.timestamps
    end
  end
end
