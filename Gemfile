source 'https://rubygems.org'

gem 'rails', '~> 5.0.0.beta3'
gem 'sass-rails', '~> 5.0'
# Temp since closure tree belongs to validation dont work correcly. Should
# use dependy from gemspec instead.
gem 'closure_tree', github: 'jayfredlund/closure_tree', ref: '9197ef9'
gem 'devise'

group :test do
  gem 'sqlite3', '>= 1.3'
  gem 'database_cleaner', ['>= 1.2', '!= 1.4.0', '!= 1.5.0']
  gem 'factory_girl', '>= 4.2'
  gem 'rubocop', '~> 0.31.0'
  gem 'simplecov', '>= 0.9', require: false
  %w(rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support).each do |lib|
    gem lib, git: "https://github.com/rspec/#{lib}.git", branch: 'master'
  end
  gem 'rails-controller-testing'
  gem 'generator_spec', '>= 0.8'
  gem 'capybara'
end

gemspec
