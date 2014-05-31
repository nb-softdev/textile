# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    market_id 1
    name "MyString"
    description "MyText"
    contact_person "MyString"
    mobile_1 "MyString"
    mobile_2 "MyString"
    mobile_3 "MyString"
    phone_1 "MyString"
    phone_2 "MyString"
    phone_3 "MyString"
    address "MyText"
    what_i_do_label "MyString"
    who_i_am_label "MyString"
    my_work_label "MyString"
    what_i_do_desc "MyText"
    who_i_am_desc "MyText"
    my_work_desc "MyText"
    footer_content "MyString"
    is_active false
  end
end
