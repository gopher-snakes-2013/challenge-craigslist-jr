class AddPriceColumn < ActiveRecord::Migration
  def up
    add_column :listings, :price, :integer
  end

  def down
    remove_column :listings, :price
  end
end
