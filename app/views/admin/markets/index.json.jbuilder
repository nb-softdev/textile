json.array!(@markets) do |market|
  json.extract! market, :id
  json.url admin_market_url(market, format: :json)
end
