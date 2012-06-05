class CreateLives < ActiveRecord::Migration
  def change
    create_table :lives do |t|
      t.integer :channel_id

      t.timestamps
    end
  end
end
