# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    name "MyString"
    title "MyString"
    description "MyText"
    published false
    order 1
    suite nil
  end
end
