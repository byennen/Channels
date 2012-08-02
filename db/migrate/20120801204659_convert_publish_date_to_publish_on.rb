class ConvertPublishDateToPublishOn < ActiveRecord::Migration
  def up
    rename_column :videos, :publish_date, :publish_on
    rename_column :posts, :publish_date, :publish_on
  end

  def down
    rename_column :videos, :publish_on, :publish_date
    rename_column :posts, :publish_on, :publish_date
  end
end
