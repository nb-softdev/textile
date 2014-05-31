class CompanyWorkType < ActiveRecord::Base
  belongs_to :company
  belongs_to :work_type
end
