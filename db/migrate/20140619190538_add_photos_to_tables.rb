class AddPhotosToTables < ActiveRecord::Migration
  def self.up
    add_attachment :users, :photo
    add_attachment :companies, :logo
    add_attachment :companies, :favicon
    add_attachment :products, :photo
    add_attachment :company_layouts, :front_background1
    add_attachment :company_layouts, :front_background2
    add_attachment :company_layouts, :front_background3
    add_attachment :company_layouts, :front_background4    
  end

  def self.down
    remove_attachment :users, :photo
    remove_attachment :companies, :logo
    remove_attachment :companies, :favicon
    remove_attachment :products, :photo
    remove_attachment :company_layouts, :front_background1
    remove_attachment :company_layouts, :front_background2
    remove_attachment :company_layouts, :front_background3
    remove_attachment :company_layouts, :front_background4    
  end
end
