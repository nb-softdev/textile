json.array!(@work_types) do |work_type|
  json.extract! work_type, :id
  json.url admin_work_type_url(work_type, format: :json)
end
