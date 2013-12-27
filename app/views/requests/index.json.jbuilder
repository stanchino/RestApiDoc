json.array!(@requests) do |request|
  json.extract! request, :id, :title, :description, :method, :entity_id
  json.url request_url(request, format: :json)
end
