json.array!(@suites) do |suite|
  json.extract! suite, :id, :name
  json.url suite_url(suite, format: :json)
end
