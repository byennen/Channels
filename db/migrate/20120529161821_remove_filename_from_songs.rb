class RemoveFilenameFromSongs < ActiveRecord::Migration
  def up
    remove_column :songs, :filename
        remove_column :songs, :file_preview
      end

  def down
    add_column :songs, :file_preview, :string
    add_column :songs, :filename, :string
  end
end
