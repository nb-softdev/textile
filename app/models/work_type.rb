class WorkType < ActiveRecord::Base
  has_many :company_work_types, dependent: :destroy
  has_many :companies, through: :company_work_types
  
  has_many :products, through: :companies, source: :products
    
  validates_presence_of :name
end
