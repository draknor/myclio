class AddFieldsToDatumType < ActiveRecord::Migration
  def change
    change_table :datum_types do |t|
      t.rename :description, :title
      t.text :description
      t.boolean :inactive
    end

  end
end
