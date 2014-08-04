class EditEntries < ActiveRecord::Migration
  def self.up
  	add_column :entries, :data, :binary, :limit => 8192
  end

  def self.down
  	remove_column :entries, :data
  end
end
