# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    sequence(:title) { |i| "Page ##{i}" }
    sequence(:description) { |i| "Page #{i} description" }
    published false
    sequence(:order)
    suite nil
  end
end
