json.array!(@assertions) do |assertion|
  json.extract! assertion, :id, :title, :description, :assignment, :expectation, :code
  json.url assertion_url(assertion, format: :json)
end
