class AddSubdomainsToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :subdomain, :string

  end
end
