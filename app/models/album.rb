class Album < ActiveRecord::Base
  belongs_to :company
  
  has_many :album_products, dependent: :destroy
  has_many :products, through: :album_products 
  
  validates_presence_of :name, :company_id, :code
  
  validates_uniqueness_of :name, :scope => :company_id
  
  scope :active, -> {where(:is_active => true)}
   
end
