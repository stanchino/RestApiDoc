# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assertion do
    title "MyString"
    description "MyText"
    assignment "MyString"
    expectation "MyString"
    code "MyText"
  end
end
