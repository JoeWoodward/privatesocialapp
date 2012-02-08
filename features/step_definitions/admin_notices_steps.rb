Given /^there are notices in the system$/ do
  visit('/admin/notices/new')
  fill_in('Title', :with => 'test1')
  fill_in('Description', :with => 'test1')
  path = File.join(::Rails.root, "public/apple-touch-icon.png")
  attach_file("Image", path)
  fill_in('Contact phone', :with => '89768796789')
  find_button('Create Notice').click
  visit('/admin/notices/new')
  fill_in('Title', :with => 'test2')
  fill_in('Description', :with => 'test2')
  path = File.join(::Rails.root, "public/apple-touch-icon.png")
  attach_file("Image", path)
  fill_in('Contact phone', :with => '89768796789')
  find_button('Create Notice').click
  visit('/admin/notices/new')
  fill_in('Title', :with => 'test3')
  fill_in('Description', :with => 'test3')
  path = File.join(::Rails.root, "public/apple-touch-icon.png")
  attach_file("Image", path)
  fill_in('Contact phone', :with => '89768796789')
  find_button('Create Notice').click
end

When /^I fill in the notice details$/ do
  fill_in('Title', :with => 'A Title')
  fill_in('Description', :with => 'A description of the notice')
  path = File.join(::Rails.root, "public/apple-touch-icon.png")
  attach_file("Image", path)
  fill_in('Contact phone', :with => '89768796789')
  find_button('Create Notice').click
end

Then /^I should create a new notice$/ do
  Notice.find_by_title('A Title').should_not be_nil
end

Then /^the notice should be deleted$/ do
  Notice.find_by_description('A description of the notice').should be_nil
end

