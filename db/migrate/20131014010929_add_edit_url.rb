class AddEditUrl < ActiveRecord::Migration
  def up
    add_column :items, :edit_url, :string
  end

  def down
    remove_column :items, :edit_url
  end
end
