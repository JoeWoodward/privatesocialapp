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
  fill_in('First name', :with => 'Steve')
  fill_in('Surname', :with => 'Jobs')
  fill_in('Email', :with => 'some.unknown.email.address@gmail.com')
  fill_in('Password', :with => 'password')
  fill_in('Password confirmation', :with => 'password')
  find_button('Continue').click
end

Then /^I should have an account$/ do
  User.find_by_email('some.unknown.email.address@gmail.com').should_not be_nil
end

Then /^I should be logged in$/ do
  cookies[:stub_user_id] == User.find_by_email('some.unknown.email.address@gmail.com')
end
