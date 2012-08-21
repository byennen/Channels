class UpdateVideosForEncoder < ActiveRecord::Migration
  def up
    add_column :videos, :zencoder_output_id, :string
    add_column :videos, :processed, :boolean
  end

  def down
    remove_column :videos, :zencoder_output_id
    remove_column :videos, :processed
  end
end
