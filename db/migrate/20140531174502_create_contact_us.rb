class CreateContactUs < ActiveRecord::Migration
  def change
    create_table :contact_us do |t|
      t.integer :company_id
      t.string :name
      t.string :email
      t.string :phone
      t.text :message

      t.timestamps
    end
  end
end
