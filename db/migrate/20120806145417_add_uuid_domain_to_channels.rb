class AddUuidDomainToChannels < ActiveRecord::Migration
  def up
    add_column :channels, :uuid, :string
    add_column :channels, :domain, :string
    Channel.all.each do |channel|
      uuid = UUID.new
      channel.uuid = uuid.generate(:compact)
      channel.save!
    end
  end
  
  def down
    remove_column :channels, :uuid
    remove_column :channels, :domain
  end
  
end