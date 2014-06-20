class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :company_id
      t.string :name
      t.text :description
      t.string :code
      t.boolean :is_active, :default => true

      t.timestamps
    end
  end
end
