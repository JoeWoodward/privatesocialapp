When /^I fill in FAQ details but do not check active$/ do
  fill_in('Question', :with => 'An inactive FAQ')
  fill_in('Answer', :with => 'The answer')
  find_button('Create Faq').click
end

Then /^I should see "([^"]*)" within "([^"]*)"$/ do |text, path|
  visit(path)
  page.should have_content(text)
end

Given /^there are FAQs in the system$/ do
  User.create(:first_name => 'Admin', :last_name => 'User', :email => 'admin@mail.com', :password => 'password', :password_confirmation => 'password', :is_admin => true)
  visit '/admin/login'
  fill_in 'Email', :with => 'admin@mail.com'
  fill_in 'Password', :with => 'password'
  find_button('Log in').click
  visit '/admin/faqs/new'
  fill_in('Question', :with => 'An inactive FAQ')
  fill_in('Answer', :with => 'The answer')
  find_button('Create Faq').click
  visit '/admin/faqs/new'
  fill_in('Question', :with => 'An active FAQ')
  fill_in('Answer', :with => 'The answer')
  p = page.driver.browser.find_element(:id, 'faq_active').click
  find_button('Create Faq').click
end

When /^I fill in FAQ details and check active$/ do
  fill_in('Question', :with => 'An active FAQ')
  fill_in('Answer', :with => 'The answer')
  p = page.driver.browser.find_element(:id, 'faq_active')
  puts p.attribute('type')
  p.click
  find_button('Create Faq').click
end

Then /^I should not see "([^"]*)"$/ do |content|
  page.should_not have_content(content)
end
