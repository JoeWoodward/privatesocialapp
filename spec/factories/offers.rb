# Read about factories at http://github.com/thoughtbot/factory_girl
Factory.define :offer do |f|
  include ActionDispatch::TestProcess

  f.name "My Offer"
  f.image fixture_file_upload('public/apple-touch-icon.png', 'image/png')
  f.active true
end
