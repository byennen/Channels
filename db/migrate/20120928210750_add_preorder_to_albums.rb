class AddPreorderToAlbums < ActiveRecord::Migration

  def up
    add_column :albums, :preorder, :boolean
    add_column :albums, :preorder_price_in_cents, :integer
    add_column :albums, :release_date, :date
    rename_column :albums, :price, :price_in_cents
    change_column :albums, :price_in_cents, :integer
    Album.all.each do |album|
      album.price_in_cents = (album.price_in_cents*100).to_i unless nil
      album.save
    end
  end

  def down
    remove_column :albums, :preorder
    remove_column :albums, :preorder_price_in_cents
    remove_column :albums, :release_date
    rename_column :albums, :price_in_cents, :price
    change_column :albums, :price, :decimal
    Album.all.each do |album|
      if album.price
        album.price = (album.price/100).to_f
        album.save
      end
    end
  end

end
