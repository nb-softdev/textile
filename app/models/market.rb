class Market < ActiveRecord::Base
  has_many :companies
  
  validates_presence_of :name
  
  scope :active, conditions: { is_active: true }
end
