class AddRandomNumForEditUrl < ActiveRecord::Migration
  def up
    add_column :posts, :edit_url, :string
  end

  def down
    remove_column :posts, :edit_url
  end
end
