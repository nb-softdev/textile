json.array!(@album_products) do |album_product|
  json.extract! album_product, :album_id, :product_id
  json.url album_product_url(album_product, format: :json)
end