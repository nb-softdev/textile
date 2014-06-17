class AddBackgroundImageColumnsToCompanyLayouts < ActiveRecord::Migration
  def self.up
    add_attachment :company_layouts, :front_background1
    add_attachment :company_layouts, :front_background2
    add_attachment :company_layouts, :front_background3
    add_attachment :company_layouts, :front_background4
  end

  def self.down
    remove_attachment :company_layouts, :front_background1
    remove_attachment :company_layouts, :front_background2
    remove_attachment :company_layouts, :front_background3
    remove_attachment :company_layouts, :front_background4
  end
end
