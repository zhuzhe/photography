class AddCategoryIdToAlbum < ActiveRecord::Migration
  def self.up
    add_column :albums, :category_id, :integer
  end

  def self.down
    remove_column :albums, :category_id
  end
end
