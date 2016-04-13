ENV['RAILS_ENV'] = 'test'
require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/vendor/bundle'
  minimum_coverage(90)
end

require File.expand_path('../dummy_app/config/environment', __FILE__)

require 'rspec/rails'
require 'factory_girl'
require 'factories'
require 'database_cleaner'

RSpec.configure do |config|
  config.include RSpec::Matchers

  config.before do
    DatabaseCleaner.start
    Ascent::Config.reset
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
