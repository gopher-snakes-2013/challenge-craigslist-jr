class AddItemSecureKey < ActiveRecord::Migration
  def up
    add_column :items, :secure_key, :string
  end

  def down
    remove_column :items, :secure_key
  end
end
