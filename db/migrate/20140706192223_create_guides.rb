class CreateGuides < ActiveRecord::Migration
  def self.up
  	create_table :guides do |t|
  		t.string :key
  		t.string :image
  		t.string :title
  		t.string :titleLabel
  	end
  end

	def self.down
		drop_table :guides
	end
end
