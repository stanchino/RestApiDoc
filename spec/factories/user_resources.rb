# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_resource do
    user nil
    resource_id 1
    type ""
    role "MyString"
  end
end
