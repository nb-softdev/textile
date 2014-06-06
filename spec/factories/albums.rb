# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :album do
    company_id 1
    name "MyString"
    description "MyText"
    code "MyString"
    is_active false
  end
end
