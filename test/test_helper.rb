ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'clearance/test_unit'
# require 'capybara/rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  fixture_path = File.expand_path("../fixtures", __FILE__)

  # Add more helper methods to be used by all tests here...
end
