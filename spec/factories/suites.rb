# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :suite do
    sequence(:name) { |i| "Suite #{i}" }
    title "MyString"
    description "MyText"
    published false
    sequence(:order)
    project nil
  end
end
