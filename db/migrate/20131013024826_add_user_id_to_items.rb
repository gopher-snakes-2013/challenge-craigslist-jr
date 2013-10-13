class AddUserIdToItems < ActiveRecord::Migration
  def up
    add_reference :items, :user_id, index: true
  end

  def down
    remove_reference :items, :user_id
  end
end
