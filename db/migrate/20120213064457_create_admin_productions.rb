class CreateAdminProductions < ActiveRecord::Migration
  def self.up
    create_table :productions do |t|
      t.string :name
      t.integer :type
      t.string :content

      t.timestamps
    end
  end

  def self.down
    drop_table :productions
  end
end
