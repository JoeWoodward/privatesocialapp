# Gems host
source 'http://rubygems.org'

gem 'rails', '~> 3.2.0'
gem 'rake', '~> 0.9.1'
gem 'sqlite3'
gem 'hirb'              # Better console formatting. Needs .hirbrc

gem 'capistrano'        # Deployment manager
gem 'sorcery'
gem 'cancan'
gem 'simple_form', git: 'git://github.com/plataformatec/simple_form.git'
gem 'friendly_id'
gem 'kaminari'
gem 'selenium'
gem 'carrierwave'
gem 'rmagick'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier', '>= 1.0.3'
  # HTML/CSS framework and boilerplate
  gem 'compass-susy-plugin', '0.9', :require => 'susy'
  gem 'compass-rails', '>= 1.0.0.rc.1'
  gem 'compass_twitter_bootstrap'
end

gem 'jquery-rails'

gem 'haml', '~> 3.1'    # Haml (html/erb replacement)

# Haml generators for Rails 3
gem 'haml-rails', :group => :development

# gem 'validates_existence', '~> 0.5' # Validation of associations

# Optional gems below:

# gem 'redcarpet'               # To convert Markdown to HTML

group :development, :test do
  gem 'rspec-rails', '~> 2.5'
  gem 'factory_girl'
  gem 'guard-rspec'
  gem 'factory_girl_rails'
  gem 'guard'
  gem 'guard-cucumber'
end

group :test do
  gem 'ruby_gntp'
end

group :cucumber do
    gem 'capybara'
    gem 'database_cleaner'
    gem 'cucumber-rails'
    gem 'cucumber'
    gem 'launchy'
    gem 'ramaze'
end
