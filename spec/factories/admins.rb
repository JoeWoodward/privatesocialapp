# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin do
    first_name "first"
    last_name "last"
    email "email@domain.com"
    password 'password'
    password_confirmation 'password'
  end
end
