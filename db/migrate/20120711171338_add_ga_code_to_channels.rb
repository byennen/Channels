class AddGaCodeToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :google_analytics_key, :string
  end
end
