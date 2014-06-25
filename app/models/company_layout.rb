class CompanyLayout < ActiveRecord::Base
  belongs_to :company
  
  belongs_to :theme, :class_name => 'CompanyLayout', :foreign_key => 'company_layout_id'
  
=begin  
  validates_presence_of  :header_background_color,
                                            :album_background_color,:contact_us_background_color,:footer_background_color,:header_font_color,
                                            :home_name_font_color,:home_description_font_color,:what_i_do_name_font_color,:what_i_do_description_font_color,
                                            :who_i_am_name_font_color,:who_i_am_description_font_color,:album_name_font_color,:album_description_font_color,
                                            :my_work_name_font_color,:my_work_description_font_color,:contact_us_name_font_color,:contact_us_description_font_color,
                                            :footer_font_color,:header_font,:home_name_font,:home_description_font,:what_i_do_name_font,:what_i_do_description_font,
                                            :who_i_am_name_font,:who_i_am_description_font,:album_name_font,:album_description_font,:my_work_name_font,
                                            :my_work_description_font,:contact_us_name_font,:contact_us_description_font,:footer_font,:header_font_size,
                                            :home_name_font_size,:home_description_font_size,:what_i_do_name_font_size,:what_i_do_description_font_size,
                                            :who_i_am_name_font_size,:who_i_am_description_font_size,:album_name_font_size,:album_description_font_size,:album_sidebar_background_color,
                                            :my_work_name_font_size,:my_work_description_font_size,:contact_us_name_font_size,:contact_us_description_font_size, :home_background_color,
                                            :footer_font_size, :header_text_background_color, :what_i_do_background_color, :who_i_am_background_color, :my_work_background_color
                                            
=end                                            
  has_attached_file :front_background1, styles: {large: "1350X655!"}
  has_attached_file :front_background2, styles: {large: "1350X655!"}
  has_attached_file :front_background3, styles: {large: "1350X655!"}
  has_attached_file :front_background4, styles: {large: "1350X655!"}
  
  validates_attachment_content_type :front_background1, :content_type => ['image/gif', 'image/jpg', 'image/jpeg', 'image/png', 'image/bmp', 'image/tiff'], :message => 'file must be of an image format'
  validates_attachment_content_type :front_background2, :content_type => ['image/gif', 'image/jpg', 'image/jpeg', 'image/png', 'image/bmp', 'image/tiff'], :message => 'file must be of an image format'
  validates_attachment_content_type :front_background3, :content_type => ['image/gif', 'image/jpg', 'image/jpeg', 'image/png', 'image/bmp', 'image/tiff'], :message => 'file must be of an image format'
  validates_attachment_content_type :front_background4, :content_type => ['image/gif', 'image/jpg', 'image/jpeg', 'image/png', 'image/bmp', 'image/tiff'], :message => 'file must be of an image format'

  validates_attachment_size :front_background1, :less_than => 10.megabytes  
  validates_attachment_size :front_background2, :less_than => 10.megabytes
  validates_attachment_size :front_background3, :less_than => 10.megabytes
  validates_attachment_size :front_background4, :less_than => 10.megabytes
  
  scope :themes, -> {where("company_id IS NULL")}
  
  def front_background1_url
    front_background1.url(:large)
  end
  
  def front_background2_url
    front_background2.url(:large)
  end
  
  def front_background3_url
    front_background3.url(:large)
  end
  
  def front_background4_url
    front_background4.url(:large)
  end
end
