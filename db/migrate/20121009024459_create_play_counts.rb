class CreatePlayCounts < ActiveRecord::Migration
  def change
    create_table :play_counts do |t|
      t.integer :plays
      t.string :playable_type
      t.integer :playable_id
      t.date :played_on

      t.timestamps
    end
  end
end
