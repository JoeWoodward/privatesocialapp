When /^I go to the VIP website$/ do
  visit('/')
end

Then /^I should see a "([^"]*)" link/ do |arg1|
  find_link(arg1).visible?
end

