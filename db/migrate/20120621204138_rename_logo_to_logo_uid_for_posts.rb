class RenameLogoToLogoUidForPosts < ActiveRecord::Migration
  def up
    rename_column :posts, :logo, :logo_uid
  end

  def down
    rename_column :posts, :logo_uid, :logo
  end
end
