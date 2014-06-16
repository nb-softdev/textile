class CreateCompanyLayouts < ActiveRecord::Migration
  def change
    create_table :company_layouts do |t|
      t.integer :company_id
      t.string :header_background_color
      t.string :home_background_color
      t.string :what_i_do_background_color
      t.string :who_i_am_background_color
      t.string :album_background_color
      t.string :my_work_background_color
      t.string :contact_us_background_color
      t.string :footer_background_color
      t.string :header_font_color
      t.string :home_name_font_color
      t.string :home_description_font_color
      t.string :what_i_do_name_font_color
      t.string :what_i_do_description_font_color
      t.string :who_i_am_name_font_color
      t.string :who_i_am_description_font_color
      t.string :album_name_font_color
      t.string :album_description_font_color
      t.string :my_work_name_font_color
      t.string :my_work_description_font_color
      t.string :contact_us_name_font_color
      t.string :contact_us_description_font_color
      t.string :footer_font_color
      t.string :header_font
      t.string :home_name_font
      t.string :home_description_font
      t.string :what_i_do_name_font
      t.string :what_i_do_description_font
      t.string :who_i_am_name_font
      t.string :who_i_am_description_font
      t.string :album_name_font
      t.string :album_description_font
      t.string :my_work_name_font
      t.string :my_work_description_font
      t.string :contact_us_name_font
      t.string :contact_us_description_font
      t.string :footer_font
      
      t.string :header_font_family
      t.string :home_name_font_family
      t.string :home_description_font_family
      t.string :what_i_do_name_font_family
      t.string :what_i_do_description_font_family
      t.string :who_i_am_name_font_family
      t.string :who_i_am_description_font_family
      t.string :album_name_font_family
      t.string :album_description_font_family
      t.string :my_work_name_font_family
      t.string :my_work_description_font_family
      t.string :contact_us_name_font_family
      t.string :contact_us_description_font_family
      t.string :footer_font_family
      
      t.string :header_font_size
      t.string :home_name_font_size
      t.string :home_description_font_size
      t.string :what_i_do_name_font_size
      t.string :what_i_do_description_font_size
      t.string :who_i_am_name_font_size
      t.string :who_i_am_description_font_size
      t.string :album_name_font_size
      t.string :album_description_font_size
      t.string :my_work_name_font_size
      t.string :my_work_description_font_size
      t.string :contact_us_name_font_size
      t.string :contact_us_description_font_size
      t.string :footer_font_size

      t.timestamps
    end
  end
end
