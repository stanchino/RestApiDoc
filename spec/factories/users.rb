# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    confirmed_at 1.day.ago
    role :user
    password "password"
    factory :admin do
      role :admin
    end
    factory :super_admin do
      role :super_admin
    end
  end
end
