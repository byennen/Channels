class CreatePresses < ActiveRecord::Migration
  def change
    create_table :presses do |t|

      t.timestamps
    end
  end
end
