class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.integer :video_id
      t.string :video
      t.string :zencoder_output_id
      t.boolean :processed

      t.timestamps
    end
  end
end
