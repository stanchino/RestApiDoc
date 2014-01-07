# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assertion do
    expectation "status"
    condition "equal"
    expected "test"
    assignment "MyVar"
  end
end
