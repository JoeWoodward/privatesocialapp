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

Then /^I should be taken to the "([^"]*)" page$/ do |page|
  current_path.should == sign_up_path
end

