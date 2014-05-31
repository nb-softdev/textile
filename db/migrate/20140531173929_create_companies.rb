class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :market_id
      t.string :name
      t.text :description
      t.string :sub_domain
      t.string :contact_person
      t.string :mobile_1
      t.string :mobile_2
      t.string :mobile_3
      t.string :phone_1
      t.string :phone_2
      t.string :phone_3
      t.text :address
      t.string :what_i_do_label
      t.string :who_i_am_label
      t.string :my_work_label
      t.text :what_i_do_desc
      t.text :who_i_am_desc
      t.text :my_work_desc
      t.string :footer_content
      t.boolean :is_active, :default => true

      t.timestamps
    end
  end
end
