class AddOrderToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :order, :integer
  end
end
