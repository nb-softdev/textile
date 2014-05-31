class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :company_id
      t.integer :category_id
      t.string :name
      t.text :description
      t.string :code
      t.float :price, :default => 0
      t.boolean :is_active, :default => true

      t.timestamps
    end
  end
end
