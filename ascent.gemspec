$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  # s.add_dependency 'closure_tree', '~> 6.0.0'
  s.add_dependency 'neat', '~> 1.1'

  s.name        = 'ascent'
  s.version     = '0.0.1'
  s.date        = '2016-04-08'

  s.summary     = 'CMS for Rails'
  s.description = 'A highly cutomiasible cms for rails'

  s.authors     = ['Ante Wall']
  s.email       = ['antewall@gmail.com']
  s.homepage    = 'http://rubygems.org/gems/ascent'

  s.files       = Dir['Gemfile', 'lib/**/*', 'app/**/*', 'config/**/*', 'Rakefile']
  s.license     = 'MIT'

  s.require_paths = %w(lib)
  s.required_ruby_version = '>= 2.3.0'
end
