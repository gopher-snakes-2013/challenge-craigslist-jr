class UpdateItems < ActiveRecord::Migration
  def up
    add_column :items, :user_id, :integer
  end

  def down
    drop_column :items, :user_id
  end
end
