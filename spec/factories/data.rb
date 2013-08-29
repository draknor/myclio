# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :datum do
    id ""
    user_id 1
    datumType_id 1
    value 1.5
    comment "MyString"
  end
end
