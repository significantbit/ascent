namespace :ascent do
  desc 'Install ascent'
  task :install do
    system 'rails g ascent:install'
  end

  desc 'Uninstall ascent'
  task :uninstall do
    system 'rails g ascent:uninstall'
  end
end
