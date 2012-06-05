class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.datetime :date
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.text :description
      t.string :logo_uid
      t.string :link
      t.string :location
      t.belongs_to :contentable, polymorphic: true

      t.timestamps
    end
    add_index :contents, [:contentable_id, :contentable_type]
  end
end
