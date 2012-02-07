# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :notice do |f|
  include ActionDispatch::TestProcess

  f.image fixture_file_upload('public/apple-touch-icon.png', 'image/png')
  f.title "MyString"
  f.description "MyText"
  f.contact_phone "89080809980"
  f.contact_email "MyString"
end
