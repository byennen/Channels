class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.integer :channel_id
      t.boolean :published

      t.timestamps
    end
  end
end
