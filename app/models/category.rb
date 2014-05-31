class Category < ActiveRecord::Base
  has_many :products
  belongs_to :parent, :class_name => 'Category', :foreign_key => 'category_id'
  has_many :children, :class_name => 'Category', :foreign_key => 'category_id'
  
  validates_presence_of :name
  
  scope :active, conditions: { is_active: true }
end