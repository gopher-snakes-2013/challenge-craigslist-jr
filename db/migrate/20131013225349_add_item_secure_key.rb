class AddItemSecureKey < ActiveRecord::Migration
  def up
    add_column :items, :item_key, :string
  end

  def down
    remove_column :items, :item_key
  end
end
