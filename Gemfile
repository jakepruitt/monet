source 'https://rubygems.org'

ruby "2.1.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
# Needs to be listed explicitly by Travis CI
gem 'rake'
# Clearance authentication framework
gem 'clearance'
# Paperclip for simplifying image management
gem 'paperclip'
# Amazon S3 SDK
gem 'aws-sdk'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# Use Foundation as a client-side framework
gem 'foundation-rails'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', :group => :doc

group :development, :test do
  # Use SQLite as the development database
  gem 'sqlite3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Testing Clearance
  gem 'capybara', '~>2.0'
  gem 'factory_girl_rails', '~> 4.2'
  gem 'rspec-rails', '~> 2.13'
  gem 'shoulda-context'
end

group :production do
  # Use PostgreSQL as the production database
  gem 'pg'
  # Use unicorn as the app server
  gem 'unicorn'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'


# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
