json.array!(@pages) do |page|
  json.extract! page, :id, :name, :title, :description, :published, :order, :suite_id
  json.url page_url(page, format: :json)
end
