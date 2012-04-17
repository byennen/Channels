class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.integer :channel_id
      t.boolean :audio
      t.boolean :vault
      t.boolean :news
      t.boolean :events
      t.boolean :giving

      t.timestamps
    end
  end
end
