json.array!(@companies) do |company|
  json.extract! company, :id
  json.url admin_company_url(company, format: :json)
end
