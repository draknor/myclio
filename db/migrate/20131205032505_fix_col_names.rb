class FixColNames < ActiveRecord::Migration
  def change
    change_table :groups do |t|
      t.rename :user_id_id, :user_id
    end

    change_table :datum_types do |t|
      t.rename :group_id_id, :group_id
    end
    
  end
end
