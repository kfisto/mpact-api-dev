class CreateEntries < ActiveRecord::Migration
  def self.up
  	create_table :entries do |t|
  		t.string :guideKey
  		t.string :name
  		t.string :file
  		t.string :image
  	end
  end

	def self.down
		drop_table :entries
	end
end
