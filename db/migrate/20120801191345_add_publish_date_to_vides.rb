class AddPublishDateToVides < ActiveRecord::Migration
  def change
    add_column :videos, :publish_date, :datetime
    remove_column :videos, :active
  end
end
