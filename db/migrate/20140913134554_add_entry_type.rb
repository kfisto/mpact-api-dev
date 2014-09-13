class AddEntryType < ActiveRecord::Migration
  def self.up
  	add_column :entries, :entrytype, :integer
  	Entry.all.each do |n|
  		n.update_attribute :entrytype, 0
  	end
  end

  def self.down
  	remove_column :entries, :entrytype
  end
end
