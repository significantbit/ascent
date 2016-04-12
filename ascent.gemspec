$:.push File.expand_path("../lib", __FILE__)


Gem::Specification.new do |s|
  #s.add_dependency 'rack', '>= 1.0'
  #s.add_dependency 'builder', '~> 3.1'
  #s.add_dependency 'rails', ['>= 5.0.0.beta3', '< 6']
  #s.add_dependency 'sass-rails', ['>= 4.0', '< 6']
  s.add_development_dependency 'bundler', '~> 1.0'

  s.name        = 'ascent'
  s.version     = '0.0.1'
  s.date        = '2016-04-08'

  s.summary     = "CMS for Rails"
  s.description = "A highly cutomiasible cms for rails"

  s.authors     = ["Ante Wall"]
  s.email       = 'antewall@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/ascent'

  s.files       = Dir['Gemfile', "lib/**/*", "app/**/*", 'Rakefile']
  s.license     = 'MIT'

  s.require_paths = %w(lib)
  s.required_ruby_version = '>= 2.3.0'
end
