class ChangeColumnsSizeToProductions < ActiveRecord::Migration
  def self.up
  	change_column :productions, :content, :string,:limit => '1000'
  	change_column :productions, :clothing, :string,:limit => '1000'
  	change_column :productions, :makeup, :string,:limit => '1000'
  	change_column :productions, :place, :string,:limit => '1000'
  	change_column :productions, :service, :string,:limit => '1000'
  	change_column :productions, :photos, :string,:limit => '1000'
  	change_column :productions, :tip, :string,:limit => '1000'
  	change_column :productions, :time, :string,:limit => '1000'
  end


  def self.down
  	change_column :productions, :content, :string
  	change_column :productions, :clothing, :string
  	change_column :productions, :makeup, :string
  	change_column :productions, :place, :string
  	change_column :productions, :service, :string
  	change_column :productions, :photos, :string
  	change_column :productions, :tip, :string
  	change_column :productions, :time, :string
  end
end
