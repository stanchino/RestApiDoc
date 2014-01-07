# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :request do
    sequence(:title) { |i| "Request ##{i}" }
    sequence(:description) { |i| "Request #{i} description" }
    sequence(:uri) { |i| "URI-#{i}" }
    body ""
    action "GET"
  end
end
