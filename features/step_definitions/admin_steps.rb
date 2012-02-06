Given /^I am an admin user$/ do
  User.create(:first_name => 'Admin', :last_name => 'User', :email => 'admin@mail.com', :password => 'password', :password_confirmation => 'password', :is_admin => true)
end

Given /^I am logged in$/ do
  visit("/admin/login")
  fill_in('Email', :with => 'admin@mail.com')
  fill_in('Password', :with => 'password')
  find_button('Log in').click
end

Given /^there are admin users in the system$/ do
  User.create(:first_name => 'Admin', :last_name => 'User', :email => 'admin.user1@mail.com', :password => 'password', :password_confirmation => 'password', :is_admin => true)
  User.create(:first_name => 'Admin', :last_name => 'User', :email => 'admin.user2@mail.com', :password => 'password', :password_confirmation => 'password', :is_admin => true)
end

Then /^I should see "([^"]*)"$/ do |content|
  page.has_content?(content)
end

When /^I fill in the details$/ do
  fill_in('First name', :with => 'First')
  fill_in('Surname', :with => 'Last')
  fill_in('Email', :with => 'new.admin@mail.com')
  fill_in('Password', :with => 'password')
  fill_in('Password confirmation', :with => 'password')
  find_button('Create').click
end

Then /^I should create a new admin user$/ do
  User.find_by_email('new.admin@mail.com').should_not be_nil
end

When /^I click another users "([^"]*)" link$/ do |link|
  page.find('a[href="/admin/accounts/admin-user--2"]', :text => 'delete').click
  page.driver.browser.switch_to.alert.accept
end

Then /^the user should be deleted$/ do
  User.find_by_email('admin.user1@mail.com').should be_nil
end

