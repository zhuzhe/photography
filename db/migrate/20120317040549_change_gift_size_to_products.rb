class ChangeGiftSizeToProducts < ActiveRecord::Migration
  def self.up
  	change_column :productions, :gift, :string,:limit => '1000'
  end

  def self.down
  	change_column :productions, :gift, :string
  end
end
