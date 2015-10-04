class EditEntries2 < ActiveRecord::Migration
  def self.up
  	remove_column :entries, :data
  end

  def self.down
  	add_column :entries, :data, :binary, :limit => 8192
  end
end
