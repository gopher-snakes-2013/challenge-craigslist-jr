class CreateItemTable < ActiveRecord::Migration
  def up
      create_table :items do |t|
        t.string :title
        t.string :description
        t.string :price
    end
  end

  def down
    drop_table :items
  end
end
