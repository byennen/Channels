class CreateFacebookPages < ActiveRecord::Migration
  def change
    create_table :facebook_pages do |t|
      t.integer :channel_id
      t.string :page_id
      t.string :name
      t.string :access_token
      t.string :category
      t.timestamps
    end
  end
end
