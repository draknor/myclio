class AddDefaultOtherGroup < ActiveRecord::Migration
  def change
    add_column :users, :other_group_id, :int
  end
end
