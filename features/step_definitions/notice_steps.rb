Given /^I have created a notice$/ do
  visit('/accounts/notices/new')
  fill_in 'Title', :with => 'My Notice'
  fill_in 'Description', :with => 'A description'
  path = File.join(::Rails.root, "public/apple-touch-icon.png")
  attach_file("Image", path)
  find_button('Create Notice').click
  puts 'created My Notice'
end
