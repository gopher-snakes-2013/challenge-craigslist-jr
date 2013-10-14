class AddTimestampsWaah < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.timestamps
    end
  end
end