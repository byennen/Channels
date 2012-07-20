class AddNewFbUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :new_fb_user, :boolean, :default => :false
  end
end
