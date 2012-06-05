class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.datetime :date
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.text :description
      t.string :logo_uid
      t.string :link
      t.string :location

      t.timestamps
    end
  end
end
