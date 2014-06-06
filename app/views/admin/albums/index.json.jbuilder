json.array!(@albums) do |album|
  json.extract! album, :company_id, :name, :description, :code, :is_active
  json.url album_url(album, format: :json)
end