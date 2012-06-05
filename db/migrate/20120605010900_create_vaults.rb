class CreateVaults < ActiveRecord::Migration
  def change
    create_table :vaults do |t|
      t.integer :channel_id

      t.timestamps
    end
  end
end
