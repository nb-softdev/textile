class Company < ActiveRecord::Base
  has_many :company_users, dependent: :destroy
  has_many :users, through: :company_users  
  
  has_many :company_work_types, dependent: :destroy
  has_many :work_types, through: :company_work_types
  
  has_many :products, dependent: :destroy
  belongs_to :market
  
  validates_presence_of :name, :sub_domain
  validates_uniqueness_of :sub_domain
  
  scope :active, -> {where(:is_active => true)}
  
  has_many :categories, through: :products, source: :category
  
  #scope :parent_categories, joins(:products => :category).where("categories.category_id IS null")
  
  has_attached_file :logo,
  styles: {
    thumb: "200x60#"
  },
  path: ":attachment/:id/:style/:filename"

  validates_attachment_content_type :logo,
                                    :content_type => ['image/gif', 'image/jpg', 'image/jpeg',
                                                      'image/png', 'image/bmp', 'image/tiff'],
                                    :message => 'file must be of an image format'
  # FIXME: this varidator is not found somehow
  # validates_attachment_file_name :media, :matches => [/gif\Z/, /jpe?g\Z/, /png\Z/, /bmp\Z/, /tif?f\Z/]
  validates_attachment_size :logo, :less_than => 1.megabytes
  
  def photo_url
    photo.url(:thumb)
  end
  
end