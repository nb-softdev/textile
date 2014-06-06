class ContactUs < ActiveRecord::Base
  belongs_to :company
  
  validates_presence_of :name, :email
end
