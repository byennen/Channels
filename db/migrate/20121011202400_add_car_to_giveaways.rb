class AddCarToGiveaways < ActiveRecord::Migration
  def change
    add_column :giveaways, :car, :boolean
  end
end
