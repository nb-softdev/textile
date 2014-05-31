class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :name
      t.text :description
      t.text :address
      t.string :city
      t.string :area
      t.integer :pincode
      t.float :latitude
      t.float :longitude
      t.boolean :is_active, :default => 1

      t.timestamps
    end
  end
end
