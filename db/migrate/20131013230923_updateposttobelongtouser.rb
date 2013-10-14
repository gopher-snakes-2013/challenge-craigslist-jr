class Updateposttobelongtouser < ActiveRecord::Migration
  def up 
    change_table :posts do |t|
      t.belongs_to :user 
    end
  end

  def down
    change_table :posts do |t|
      remove_column :user_id
    end
  end
end
