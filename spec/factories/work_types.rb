# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :work_type do
    name "MyString"
    description "MyText"
    is_active false
  end
end
