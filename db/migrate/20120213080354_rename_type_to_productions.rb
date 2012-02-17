class RenameTypeToProductions < ActiveRecord::Migration
  def self.up
  	rename_column :productions, :type, :producion_type
  end

  def self.down
  	rename_column :productions, :producion_type, :type
  end
end
