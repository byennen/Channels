class CreateGives < ActiveRecord::Migration
  def change
    create_table :gives do |t|
      t.integer :channel_id

      t.timestamps
    end
  end
end
