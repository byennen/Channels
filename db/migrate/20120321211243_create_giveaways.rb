class CreateGiveaways < ActiveRecord::Migration
  def change
    create_table :giveaways do |t|
      t.string :email
      t.boolean :derby, :default => false
      t.boolean :cma, :default => false

      t.timestamps
    end
  end
end
