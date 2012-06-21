class AddPhotoAndVideoToPost < ActiveRecord::Migration
  def change
    add_column :posts, :photo_id, :integer
    add_column :posts, :video_id, :integer
  end
end
