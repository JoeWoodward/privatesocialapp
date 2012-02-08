# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :event do |f|
  include ActionDispatch::TestProcess

  f.title "MyString"
  f.description "MyText"
  f.date "2112-02-07"
  f.image fixture_file_upload('public/apple-touch-icon.png', 'image/png')
end
