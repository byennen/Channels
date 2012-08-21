class AddPreviewToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :preview, :boolean
  end
end
