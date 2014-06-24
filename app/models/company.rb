class Company < ActiveRecord::Base
  has_one :company_user, dependent: :destroy
  has_one :user, through: :company_user  
  
  has_many :company_work_types, dependent: :destroy
  has_many :work_types, through: :company_work_types
  
  has_many :contact_us, class_name: 'ContactUs' 
  
  has_one :layout, class_name: 'CompanyLayout'
  
  #accepts_nested_attributes_for :company_work_types
  
  has_many :products, dependent: :destroy
  belongs_to :market
  
  has_many :albums, dependent: :destroy
  
  has_many :categories, through: :products, source: :category
  
  validates_presence_of :name, :sub_domain
  validates_uniqueness_of :sub_domain
  
  scope :active, -> {where(:is_active => true)}
  
  #scope :parent_categories, joins(:products => :category).where("categories.category_id IS null")
  
  has_attached_file :logo,
  styles: {
    thumb: "200x60!",
    format: 'ico'
  }
  
  has_attached_file :favicon,
  styles: { thumb: "16x16!" }  

  validates_attachment_content_type :logo,
                                    :content_type => ['image/gif', 'image/jpg', 'image/jpeg',
                                                      'image/png', 'image/bmp', 'image/tiff'],
                                    :message => 'file must be of an image format'
  # FIXME: this varidator is not found somehow
  # validates_attachment_file_name :media, :matches => [/gif\Z/, /jpe?g\Z/, /png\Z/, /bmp\Z/, /tif?f\Z/]
  validates_attachment_size :logo, :less_than => 1.megabytes
  
  def logo_url
    logo.url(:thumb)
  end

  def favicon_url
    favicon.url(:thumb)
  end  
  
  def original_url
    favicon.url(:original)
  end  
  
end
