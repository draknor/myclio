class ChangeDatumValueToString < ActiveRecord::Migration
  def up
    change_column :data, :value, :string
  end

  def down
    change_column :data, :value, :float
  end
end
