class FixIDcolumns < ActiveRecord::Migration
  def change
    rename_column :data, :user_id_id, :user_id
    rename_column :data, :datumType_id_id, :datumType_id
    rename_column :datum_types, :user_id_id, :user_id

  end
end
