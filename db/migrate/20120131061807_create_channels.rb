class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.text :description
      t.boolean :audio_feature
      t.boolean :vault_feature
      t.boolean :news_feature
      t.boolean :events_feature
      t.boolean :giving_feature

      t.timestamps
    end
  end
end
