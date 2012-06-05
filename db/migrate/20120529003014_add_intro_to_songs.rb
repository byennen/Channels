class AddIntroToSongs < ActiveRecord::Migration
  def change
  	add_column :songs, :intro, :boolean, :default => false
  end
end
