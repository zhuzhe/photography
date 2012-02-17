class ChangeTimeToProductions < ActiveRecord::Migration
  def self.up
  	remove_column :productions, :time
  	add_column :productions, :time, :string
  end

  def self.down
  	add_column :productions, :time, :string
  	remove_column :productions, :time
  end
end
