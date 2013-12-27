# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :request do
    title "MyString"
    description "MyText"
    "method" "MyString"
    entity nil
  end
end
