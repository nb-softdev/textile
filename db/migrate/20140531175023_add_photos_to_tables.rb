class AddPhotosToTables < ActiveRecord::Migration
  def self.up
    add_attachment :users, :photo, :after => :name
    add_attachment :companies, :logo, :after => :name
    add_attachment :products, :photo, :after => :name
  end

  def self.down
    remove_attachment :users, :photo
    remove_attachment :companies, :logo
    remove_attachment :products, :photo
  end
end
