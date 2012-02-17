# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', :version => 2, :cli => "--color" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/models/.+\.rb$})
end

guard 'cucumber' do
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})          { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
end

guard 'livereload' do
  watch(%r{app/helpers/.+\.rb})
  watch(%r{app/views/.+\.(erb|haml)})
  watch(%r{(public/).+\.(css|js|html)})
  watch(%r{app/assets/stylesheets/(.+\.css).*$})    { |m| "assets/#{m[1]}" }
  watch(%r{app/assets/javascripts/(.+\.js).*$}) { |m| "assets/#{m[1]}" }
  watch(%r{lib/assets/stylesheets/(.+\.css).*$})    { |m| "assets/#{m[1]}" }
  watch(%r{lib/assets/javascripts/(.+\.js).*$}) { |m| "assets/#{m[1]}" }
  watch(%r{vendor/assets/stylesheets/(.+\.css).*$}) { |m| "assets/#{m[1]}" }
  watch(%r{vendor/assets/javascripts/(.+\.js).*$})  { |m| "assets/#{m[1]}" }
  watch(%r{config/locales/.+\.yml})
end