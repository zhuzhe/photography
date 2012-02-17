class ChangeProductions < ActiveRecord::Migration
  def self.up
  	add_column :productions, :clothing, :string
  	add_column :productions, :makeup, :string
  	add_column :productions, :place, :string
  	add_column :productions, :service, :string
  	add_column :productions, :photos, :string
  	add_column :productions, :gift, :string
  	add_column :productions, :tip, :string
  	add_column :productions, :time, :date
  end

  def self.down
  	remove_column :productions, :clothing
  	remove_column :productions, :makeup
  	remove_column :productions, :place
  	remove_column :productions, :service
  	remove_column :productions, :photos 
  	remove_column :productions, :gift
  	remove_column :productions, :tip
  	remove_column :productions, :time
  end
end
