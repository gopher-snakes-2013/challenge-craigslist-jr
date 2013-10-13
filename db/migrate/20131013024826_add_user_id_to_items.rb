class AddUserIdToItems < ActiveRecord::Migration
  def up
    add_reference :items, :user, index: true
  end

  def down
    remove_reference :items, :user
  end
end
