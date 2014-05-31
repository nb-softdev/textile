class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  scope :active, conditions: { is_active: true }
  
  has_attached_file :photo,
  styles: {
    thumb: "200x200#"
  },
  path: ":attachment/:id/:style/:filename"
  
  validates_attachment_content_type :photo,
                                    :content_type => ['image/gif', 'image/jpg', 'image/jpeg',
                                                      'image/png', 'image/bmp', 'image/tiff'],
                                    :message => 'file must be of an image format'
  # FIXME: this varidator is not found somehow
  # validates_attachment_file_name :media, :matches => [/gif\Z/, /jpe?g\Z/, /png\Z/, /bmp\Z/, /tif?f\Z/]
  validates_attachment_size :media, :less_than => 1.megabytes  
  
  def photo_url
    photo.url(:thumb)
  end

  def photo_url_original
    photo.url(:original)
  end  
  
end
