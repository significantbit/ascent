require 'rails/generators'
require File.expand_path('../utils', __FILE__)
module Ascent
  # Installation generator for Ascent
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    include Generators::Utils::InstanceMethods
    include Rails::Generators::Migration

    argument :_namespace,
             type: :string,
             required: false,
             desc: 'Ascent admin url namespace'

    desc 'Ascent installation generator'

    def install
      text = 'Where do you want to mount the ascent admin?'
      namespace = ask_for(text, 'admin', _namespace)
      route("mount Ascent::Engine => '/#{namespace}', as: 'ascent'")
      template 'initializer.rb', 'config/initializers/ascent.rb'
      copy_migration 'create_ascent_migration'
    end

    private

    def copy_migration(file)
      if self.class.migration_exists?('db/migrate', "#{file}")
        say_status('skipped', "Migration #{file}.rb already exists")
      else
        migration_template "migrations/#{file}.rb", "db/migrate/#{file}.rb"
      end
    end

    def self.next_migration_number(_dir)
      Time.now.utc.strftime('%Y%m%d%H%M%S')
    end

    def migration_version
      "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
    end
  end
end
