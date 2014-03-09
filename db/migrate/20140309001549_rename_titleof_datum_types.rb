class RenameTitleofDatumTypes < ActiveRecord::Migration
  def change
    change_table :datum_types do |t|
      t.rename :title, :name
    end

  end
end
