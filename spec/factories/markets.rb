# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :market do
    name "MyString"
    description "MyText"
    address "MyText"
    city "MyString"
    area "MyString"
    pincode 1
    latitude 1.5
    longitude 1.5
    is_active false
  end
end
