When /^I fill in offers details but do not check active$/ do
  fill_in('Name', :with => 'An inactive offer')
  path = File.join(::Rails.root, "public/apple-touch-icon.png")
  attach_file("Image", path)
  find_button('Create Offer').click
end

When /^I fill in offers details and check active$/ do
  fill_in('Name', :with => 'An active offer')
  path = File.join(::Rails.root, "public/apple-touch-icon.png")
  attach_file("Image", path)
  page.driver.browser.find_element(:id, "offer_active").click
  find_button('Create Offer').click
end

Given /^there are offers in the system$/ do
  FactoryGirl.create(:offer, :name => 'an offer')
  FactoryGirl.create(:offer, :name => 'another offer')
  FactoryGirl.create(:offer, :name => 'yet another offer')
end
