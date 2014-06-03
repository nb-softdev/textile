json.array!(@contact_us) do |contact_u|
  json.extract! contact_u, :id
  json.url company_contact_u_url(contact_u, format: :json)
end
