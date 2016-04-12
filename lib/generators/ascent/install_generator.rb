require 'rails/generators'
require File.expand_path('../utils', __FILE__)
module Ascent
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      include Generators::Utils::InstanceMethods

      argument :_namespace, type: :string, required: false, desc: 'Ascent admin url namespace'
      desc 'Ascent installation generator'

      def install
        namespace = ask_for('Where do you want to mount the ascent admin?', 'admin', _namespace)
        route("mount Ascent::Engine => '/#{namespace}', as: 'ascent'")
        template 'initializer.rb', 'config/initializers/ascent.rb'
      end

    end
end
