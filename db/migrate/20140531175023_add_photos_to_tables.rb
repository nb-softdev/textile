class AddPhotosToTables < ActiveRecord::Migration
  def self.up
    add_attachment :users, :photo
    add_attachment :companies, :logo
    add_attachment :products, :photo
  end

  def self.down
    remove_attachment :users, :photo
    remove_attachment :companies, :logo
    remove_attachment :products, :photo
  end
end
