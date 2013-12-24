# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :suite do
    name "MyString"
    title "MyString"
    description "MyText"
    published false
    order 1
    project nil
  end
end
