# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :suite do
    sequence(:title) { |i| "Suite #{i}" }
    sequence(:description) { |i| "Suite #{i} description" }
    published false
    sequence(:order)
    project nil
  end
end
