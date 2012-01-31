class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.float :price

      t.timestamps
    end

    Role.create :name => "admin", :price => nil
    Role.create :name => "silver", :price => "19.95"
    Role.create :name => "gold", :price => "24.95"
  end
end
