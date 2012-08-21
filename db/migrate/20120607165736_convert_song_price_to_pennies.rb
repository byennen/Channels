class ConvertSongPriceToPennies < ActiveRecord::Migration
  def up
    remove_column :songs, :price
    add_column :songs, :price_in_cents, :integer
  end

  def down
    remove_column :songs, :price_in_cents
    add_column :songs, :price, :float
  end
end
