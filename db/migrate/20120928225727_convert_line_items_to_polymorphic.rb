class ConvertLineItemsToPolymorphic < ActiveRecord::Migration
  def up
    rename_column :line_items, :song_id, :purchasable_id
    add_column :line_items, :purchasable_type, :string
    LineItem.all.each do |li|
      li.purchasable_type = 'Song'
      li.save
    end
  end

  def down
    rename_column :line_items, :purchasable_id, :song_id
    remove_column :line_items, :purchasable_type
  end
end
