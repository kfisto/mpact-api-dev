class RemoveIdxColumnFromNotes < ActiveRecord::Migration
  def self.up
  	remove_column :notes, :idx
  end

  def self.down
  	add_column :notes, :idx
  end
end
