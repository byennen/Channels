class AddFriendlyIdToPostsSongsVideos < ActiveRecord::Migration
  def change
    add_column :posts, :slug, :string
    add_column :songs, :slug, :string
    add_column :videos, :slug, :string

    add_index :posts, :slug
    add_index :songs, :slug
    add_index :videos, :slug

    Post.all.each { |post| post.save! }
    Song.all.each { |song| song.save! }
    Video.all.each { |video| video.save! }

  end
end
