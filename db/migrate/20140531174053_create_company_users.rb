class CreateCompanyUsers < ActiveRecord::Migration
  def change
    create_table :company_users do |t|
      t.integer :company_id
      t.integer :user_id
      t.string :role, :default => "MANAGER"

      t.timestamps
    end
  end
end
