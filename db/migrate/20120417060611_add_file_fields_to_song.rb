class AddFileFieldsToSong < ActiveRecord::Migration
  def change
    add_column :songs, :filename, :string
    add_column :songs, :file_preview, :string
    add_column :songs, :active, :boolean
  end
end
