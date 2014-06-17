class AddBackgroundColorColumnsToCompanyLayouts < ActiveRecord::Migration
  def change
    add_column :company_layouts, :what_i_do_background_color, :string, :after => :header_text_background_color
    add_column :company_layouts, :who_i_am_background_color, :string, :after => :what_i_do_background_color
    add_column :company_layouts, :my_work_background_color, :string, :after => :who_i_am_background_color
  end
end
