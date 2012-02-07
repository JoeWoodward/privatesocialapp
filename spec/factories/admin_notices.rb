# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notice do
    image "MyString"
    title "MyString"
    description "MyText"
    contact_phone "89080809980"
    contact_email "MyString"
  end
end
