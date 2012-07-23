class AddSocialNetworksToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :facebook_page, :string
    add_column :channels, :twitter_id, :string
    add_column :channels, :google_plus_page, :string
  end
end
