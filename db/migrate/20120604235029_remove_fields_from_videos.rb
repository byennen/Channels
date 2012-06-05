class RemoveFieldsFromVideos < ActiveRecord::Migration
  def up
    remove_column :videos, :short_video_uid
    remove_column :videos, :full_video_uid
  end

  def down
    add_column :videos, :full_video_uid, :string
    add_column :videos, :short_video_uid, :string
  end
end
