class EditEntries < ActiveRecord::Migration
  def self.up
  	add_column :data, :version_comment, :binary, :limit => 1.megabyte
  end

  def self.down
  	remove_column :data, :version_comment
  end
end
