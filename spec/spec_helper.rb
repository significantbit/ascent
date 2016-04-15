ENV['RAILS_ENV'] = 'test'
app_path = '../dummy_app'

require File.expand_path("#{app_path}/config/environment", __FILE__)
require 'rspec/rails'
require 'factory_girl'
require 'database_cleaner'
require 'simplecov'

def silence_stream(stream)
  old_stream = stream.dup
  stream.reopen(RbConfig::CONFIG['host_os'] =~ /mswin|mingw/ ? 'NUL:' : '/dev/null')
  stream.sync = true
  yield
ensure
  stream.reopen(old_stream)
  old_stream.close
end

# Setup database for test
DatabaseCleaner.strategy = :transaction

ActiveRecord::Base.connection.tables.each do |table|
  ActiveRecord::Base.connection.drop_table(table)
end

# Run all migrations
silence_stream(STDOUT) do
  ActiveRecord::Migrator.migrate File.expand_path("#{app_path}/db/migrate/", __FILE__)
end

# Simplecov Config
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/vendor/bundle'
  minimum_coverage(90)
end

RSpec.configure do |config|
  config.include RSpec::Matchers
  config.include FactoryGirl::Syntax::Methods
  FactoryGirl.find_definitions

  config.before do
    DatabaseCleaner.start
    Ascent::Config.reset
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
