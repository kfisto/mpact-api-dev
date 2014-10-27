class CreateNotes < ActiveRecord::Migration
  def self.up
  	create_table :notes do |t|
  		t.string :idx
  		t.text :text
  		t.timestamps		#created_at, updated_at
  		t.integer :entry_id
  	end
  end

  def self.down
	drop_table :notes
  end
end
