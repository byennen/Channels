class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :channel_id
      t.string :title
      t.text :description
      t.boolean :paid
      t.boolean :active
      t.string :image_uid

      t.timestamps
    end
  end
end
