class AddBannerImageToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :banner_image_uid, :string

  end
end
