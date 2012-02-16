# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :faq do
    question "MyString"
    answer "MyText"
    viewed 1
    active false
  end
end
