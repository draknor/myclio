class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.primary_key :id
      t.belongs_to :user_id
      t.belongs_to :datumType_id
      t.float :value
      t.string :comment

      t.timestamps
    end
  end
end
