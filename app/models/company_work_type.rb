class CompanyWorkType < ActiveRecord::Base
  belongs_to :company
  belongs_to :work_type
  
  validates_uniqueness_of :work_type_id, :scope => :company_id
end
