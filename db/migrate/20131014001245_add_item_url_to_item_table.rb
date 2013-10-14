class AddItemUrlToItemTable < ActiveRecord::Migration
  def up
    add_column :items, :item_url, :string
  end

  def down
    remove_column :items, :item_url
  end
end
