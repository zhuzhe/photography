class AddColumnToMessages < ActiveRecord::Migration
  def self.up  
    create_table :messages
    add_column :messages, :name, :string
    add_column :messages, :phone, :string
    add_column :messages, :qq, :string
    add_column :messages, :email, :string
    add_column :messages, :address, :string
    add_column :messages, :title, :string
    add_column :messages, :content, :string
  end

  def self.down      
    drop_table :messages
    remove_column :messages, :content
    remove_column :messages, :title
    remove_column :messages, :address
    remove_column :messages, :email
    remove_column :messages, :qq
    remove_column :messages, :phone
    remove_column :messages, :name
  end
end
