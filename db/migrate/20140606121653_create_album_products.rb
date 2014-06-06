class CreateAlbumProducts < ActiveRecord::Migration
  def change
    create_table :album_products do |t|
      t.integer :album_id
      t.integer :product_id

      t.timestamps
    end
  end
end
