class RenameProductionTypeToProductions < ActiveRecord::Migration
  def self.up
  	rename_column :productions, :producion_type, :category
  end

  def self.down
  	rename_column :productions, :category, :producion_type
  end
end
