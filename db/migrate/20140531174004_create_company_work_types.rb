class CreateCompanyWorkTypes < ActiveRecord::Migration
  def change
    create_table :company_work_types do |t|
      t.integer :company_id
      t.integer :work_type_id

      t.timestamps
    end
  end
end
