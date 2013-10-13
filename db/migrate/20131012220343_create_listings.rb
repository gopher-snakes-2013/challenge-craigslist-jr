class CreateListings < ActiveRecord::Migration
  def up
    create_table :listings do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end

  def down
    drop_table :listings
  end
end
