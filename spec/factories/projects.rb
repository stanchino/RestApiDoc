# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name "MyString"
    title "MyString"
    description "MyText"
    published false
  end
end
