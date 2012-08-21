class AddVideoPreviewColumnsToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :video, :string
    add_column :videos, :preview, :string
  end
end
