json.array!(@products) do |product|
  json.extract! product, :id
  json.url company_product_url(product, format: :json)
end
