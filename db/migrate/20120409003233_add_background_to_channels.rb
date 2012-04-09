class AddBackgroundToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :background_image_uid, :string

  end
end
