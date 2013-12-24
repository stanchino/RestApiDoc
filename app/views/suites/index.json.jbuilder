json.array!(@suites) do |suite|
  json.extract! suite, :id, :name, :title, :description, :published, :order, :project_id
  json.url suite_url(suite, format: :json)
end
