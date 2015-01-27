class AddIsPrivateToDatumType < ActiveRecord::Migration
  def change
    add_column :datum_types, :is_private, :boolean
  end
end
