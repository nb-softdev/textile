# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact_u, :class => 'ContactUs' do
    company_id 1
    name "MyString"
    email "MyString"
    phone "MyString"
    message "MyText"
  end
end
