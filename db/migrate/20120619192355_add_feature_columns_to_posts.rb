class AddFeatureColumnsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :start_date, :date
    add_column :posts, :end_date, :date
    add_column :posts, :link, :string
    add_column :posts, :location, :string
    add_column :posts, :logo, :string
  end

end
