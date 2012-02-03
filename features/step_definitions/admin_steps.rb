Given /^I am already an admin member$/ do
  u = User.new(:first_name => 'Joe', :last_name => 'Woodward', :email => 'email@gmail.com', :password => 'password', :password_confirmation => 'password', :is_admin => true)
  u.save
end

Given /^I am logged in$/ do
  visit('/admin/login')
  fill_in('Email', :with => 'email@gmail.com')
  fill_in('Password', :with => 'password')
  find_button('Log in').click
end

When /^I go to the "([^"]*)" page$/ do |page|
  visit(page)
end

When /^I fill in the details for a new account$/ do
  fill_in('First name', :with => 'Joe')
  fill_in('Surname', :with => 'Woodward')
  fill_in('Email', :with => 'email@gmail.com')
  fill_in('Password', :with => 'password')
  fill_in('Password confirmation', :with => 'password')
  find_button('Continue').click
end

Then /^I should create a new account$/ do
  User.find_by_email('email@gmail.com').should_not be_nil
end

When /^There are admin users$/ do
  User.new(:first_name => 'Joe', :last_name => 'Woodward', :email => 'email@gmail.com', :password => 'password', :password_confirmation => 'password', :is_admin => true)
  User.new(:first_name => 'Ben', :last_name => 'Woodward', :email => 'another.email@gmail.com', :password => 'password', :password_confirmation => 'password', :is_admin => true)
end

Then /^I should see a list of users$/ do
  find_
end
