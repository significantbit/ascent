require 'ascent'
require 'neat'

module Ascent
  module Admin
    class Engine < Rails::Engine
      config.autoload_paths += Dir["#{config.root}/lib/**/"]
      isolate_namespace Ascent

      rake_tasks do
        Dir[File.join(File.dirname(__FILE__), '../tasks/*.rake')].each do |f|
          load f
        end
      end
    end
  end
end
