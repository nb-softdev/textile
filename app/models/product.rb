class Product < ActiveRecord::Base
  belongs_to :company
  belongs_to :category

  has_many :album_products, dependent: :destroy
  has_many :albums, through: :album_products
  
  validates_presence_of :name, :company_id, :code
  
  scope :active, -> {where(:is_active => true)}
  
  has_attached_file :photo,
  styles: {
    thumb: "400x",
    small: "200x"
    original: "100%"
  }
  
  validates_attachment_content_type :photo,
                                    :content_type => ['image/gif', 'image/jpg', 'image/jpeg',
                                                      'image/png', 'image/bmp', 'image/tiff'],
                                    :message => 'file must be of an image format'
  # FIXME: this varidator is not found somehow
  # validates_attachment_file_name :media, :matches => [/gif\Z/, /jpe?g\Z/, /png\Z/, /bmp\Z/, /tif?f\Z/]
  validates_attachment_size :photo, :less_than => 2.megabytes  
  
  def photo_url
    photo.url(:thumb)
  end

  def photo_url_original
    photo.url(:original)
  end
  
  def photo_url_small
    photo.url(:small)
  end
end
