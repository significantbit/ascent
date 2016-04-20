ENV['RAILS_ENV'] = 'test'
app_path = '../dummy_app'
require 'simplecov'
# Simplecov Config
SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter]
SimpleCov.start do
  add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'

  add_filter '/spec/'
  add_filter '/vendor/bundle/'

  minimum_coverage(91.21)
end

require File.expand_path("#{app_path}/config/environment", __FILE__)
require 'rspec/rails'
require 'factory_girl'
require 'database_cleaner'

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

ActiveRecord::Base.connection.data_sources.each do |table|
  ActiveRecord::Base.connection.drop_table(table)
end

# Run all migrations
silence_stream(STDOUT) do
  ActiveRecord::Migrator.migrate File.expand_path("#{app_path}/db/migrate/", __FILE__)
end

RSpec.configure do |config|
  config.use_transactional_fixtures = true
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
