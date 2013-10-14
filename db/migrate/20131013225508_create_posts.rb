class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :user_id
      t.string :title
      t.string :description
      t.string :cost

      t.timestamp
    end
  end

  def down
    drop_table :posts
  end
end
