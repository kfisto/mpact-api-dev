class RemoveFileColumn < ActiveRecord::Migration
  def self.up
  	remove_column :entries, :file
  end

  def self.down
  	add_column :entries, :file, :string
  end
end
