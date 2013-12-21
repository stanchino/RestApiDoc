json.array!(@pages) do |page|
  json.extract! page, :id, :name, :suite_id
  json.url page_url(page, format: :json)
end
