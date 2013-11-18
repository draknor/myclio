class AddEffDateTimeToDatum < ActiveRecord::Migration
  def self.up
    add_column :data, :effective_at, :datetime
    add_index :data, [:user_id, :effective_at]


    # copy data from created_at to effective_at
    Datum.reset_column_information
    datum = Datum.find(:all)
    datum.each do |d|
      d.effective_at = d.created_at
      d.save
    end
  end

  def self.down
    remove_column :data, :effective_at
  end

end
