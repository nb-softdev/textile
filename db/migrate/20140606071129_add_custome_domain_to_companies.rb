class AddCustomeDomainToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :custom_domain, :string, :after => :sub_domain
  end
end
