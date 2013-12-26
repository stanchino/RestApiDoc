# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    sequence(:name) { |i| "MyString #{i}" }
    title "MyString"
    description "MyText"
    published false
  end
end
