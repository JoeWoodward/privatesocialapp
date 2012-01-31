When /^I go to the VIP website$/ do
  visit('/')
end

Then /^I should see a "([^"]*)" link/ do |link|
  find_link(link).visible?
end

Given /^I am on the VIP website homepage$/ do
  visit('/')
end

When /^I click the "([^"]*)" link$/ do |link|
  find_link(link).click
end

Then /^I should be taken to "([^"]*)"$/ do |page|
  current_path.should == page
end

Given /^I am on the "([^"]*)" page$/ do |page|
  visit(page)
end

When /^I fill in my details correctly and submit them$/ do
  fill_in('First Name', :with => 'Steve')
  fill_in('Last Name', :with => 'Jobs')
  fill_in('Email', :with => 'some.unknown.email.address@gmail.com')
  fill_in('Password', :with => 'password')
  fill_in('Password Confirmation', :with => 'password')
  find_button('Continue').click
end

Then /^I should have an account$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should be logged in$/ do
  pending # express the regexp above with the code you wish you had
end
