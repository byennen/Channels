class AddBackgroundColorToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :background_color, :string

  end
end
