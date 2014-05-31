# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    company_id 1
    category_id 1
    name "MyString"
    description "MyText"
    code "MyString"
    price 1.5
    is_active false
  end
end
