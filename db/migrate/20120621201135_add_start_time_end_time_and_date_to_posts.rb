class AddStartTimeEndTimeAndDateToPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :start_date
    remove_column :posts, :end_date
    add_column :posts, :date, :date
    add_column :posts, :start_time, :datetime
    add_column :posts, :end_time, :datetime
  end
  
end
