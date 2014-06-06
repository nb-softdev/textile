class AlbumProduct < ActiveRecord::Base
  belongs_to :album
  belongs_to :product

  validates_presence_of :album_id, :product_id
  
  validates_uniqueness_of :product_id, :scope => :album_id 
end