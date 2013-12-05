class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.primary_key :id
      t.string :name
      t.belongs_to :user_id

      t.timestamps
    end

    change_table :datum_types do |t|
      t.belongs_to :group_id
    end
  end
end
