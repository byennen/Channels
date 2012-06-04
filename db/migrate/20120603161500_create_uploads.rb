class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :file_name
      t.string :file_type
      t.string :file_size
      t.belongs_to :uploadable, polymorphic: true

      t.timestamps
    end
    add_index :uploads, [:uploadable_id, :uploadable_type]
  end
end
