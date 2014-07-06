class EditGuides < ActiveRecord::Migration
  def self.up
  	rename_column :guides, :titleLabel, :textLabel
  end
  def self.down
  	rename_column :guides, :textLabel, :titleLabel
  end
end
