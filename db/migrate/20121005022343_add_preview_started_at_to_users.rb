class AddPreviewStartedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :preview_started_at, :datetime
  end
end
