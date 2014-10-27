class AddAuthorColumn < ActiveRecord::Migration
  def self.up
  	add_column :notes, :author, :string
  end

  def self.down
  	remove_column :notes, :author
  end
end
