class CreateDatumTypes < ActiveRecord::Migration
  def change
    create_table :datum_types do |t|
      t.primary_key :id
      t.string :description
      t.belongs_to :user_id

      t.timestamps
    end
  end
end
