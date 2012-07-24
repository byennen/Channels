class AddActiveToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :active, :boolean
  end
end
