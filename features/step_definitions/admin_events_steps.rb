Given /^an admin user has logged in$/ do
  User.create(:first_name => 'Admin', :last_name => 'User', :email => 'admin@mail.com', :password => 'password', :password_confirmation => 'password', :is_admin => true)
  visit("/admin/login")
  fill_in('Email', :with => 'admin@mail.com')
  fill_in('Password', :with => 'password')
  find_button('Log in').click
end

Given /^there are events in the system$/ do
  visit('/admin/events/new')
  fill_in('Title', :with => 'test1')
  fill_in('Description', :with => 'different info')
  select('10', :from => "event[date(3i)]")
  select('February', :from => "event[date(2i)]")
  select('2020', :from => "event[date(1i)]")
  path = File.join(::Rails.root, "public/apple-touch-icon.png")
  attach_file("Image", path)
  find_button('Create Event').click
  visit('/admin/events/new')
  fill_in('Title', :with => 'test2')
  fill_in('Description', :with => 'any info')
  select('10', :from => "event[date(3i)]")
  select('February', :from => "event[date(2i)]")
  select('2020', :from => "event[date(1i)]")
  path = File.join(::Rails.root, "public/apple-touch-icon.png")
  attach_file("Image", path)
  find_button('Create Event').click
  visit('/admin/events/new')
  fill_in('Title', :with => 'test3')
  fill_in('Description', :with => 'more info')
  select('10', :from => "event[date(3i)]")
  select('February', :from => "event[date(2i)]")
  select('2020', :from => "event[date(1i)]")
  path = File.join(::Rails.root, "public/apple-touch-icon.png")
  attach_file("Image", path)
  find_button('Create Event').click
end

When /^I fill in the event details$/ do
  fill_in('Title', :with => 'test1')
  fill_in('Description', :with => 'any info')
  select('10', :from => "event[date(3i)]")
  select('February', :from => "event[date(2i)]")
  select('2020', :from => "event[date(1i)]")
  path = File.join(::Rails.root, "public/apple-touch-icon.png")
  attach_file("Image", path)
  find_button('Create Event').click
end

Then /^I should create a new event$/ do
  Event.find_by_description('any info').should_not be_nil
end

When /^confirm the alert$/ do
  alert = page.driver.browser.switch_to.alert
  puts alert.text
  alert.accept
end

Then /^the event should be deleted$/ do
  Event.find_by_description('different info').should be_nil
end
