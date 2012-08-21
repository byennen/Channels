class AddFeaturesToPost < ActiveRecord::Migration
  def up
    add_column :posts, :feature, :string
  end
  
  def down
    remove_column :posts, :features
  end
  
end
