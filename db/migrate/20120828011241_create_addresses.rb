class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip_code
      t.timestamps
    end
  end
end
