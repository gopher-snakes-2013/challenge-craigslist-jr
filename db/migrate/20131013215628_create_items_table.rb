class CreateItemsTable < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.string :title
      t.string :description
      t.string :price
      t.string :item_key

      t.timestamps
    end
  end

  def down
    drop_table :items
  end
end
