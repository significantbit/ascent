Dir['lib/tasks/*.rake'].each { |rake| load rake }

require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task test: :spec

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError
  desc 'Run RuboCop'
  task :rubocop do
    $stderr.puts 'Rubocop is disabled'
  end
end

task default: [:spec, :rubocop]

task :reset do
  if File.exist?('rm spec/dummy_app/config/initializers/ascent.rb')
    puts 'Removing Ascent initalizer file'
    sh 'rm spec/dummy_app/config/initializers/ascent.rb'
  end
  Dir.entries('spec/dummy_app/db/migrate').each do |f|
    if f.include?('create_ascent_')
      puts "Removing file #{f}"
      sh "rm spec/dummy_app/db/migrate/#{f}"
    end
  end
  sh 'gem uninstall ascent'
  puts 'Finsihed resetting'
end
