Given /^I am already an admin member$/ do
  Admin.new(:first_name => 'Joe', :last_name => 'Woodward', :email => 'email@gmail.com', :password => 'password', :password_confirmation => 'password')
end

Given /^I am logged in$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I go to the "([^"]*)" page$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I fill in the details for a new account$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should create a new account$/ do
  pending # express the regexp above with the code you wish you had
end
