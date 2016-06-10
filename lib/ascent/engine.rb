require 'ascent'
require 'neat'
	
module Ascent
  # Ascent Engine
  class Engine < Rails::Engine
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    isolate_namespace Ascent

    def reload_routes
      Rails.application.routes_reloader.reload!
    end

    initializer 'Ascent precompile hook', group: :all do |app|
      app.config.assets.precompile += %w(
        ascent/ascent.css
        ascent/ascent_128x128.png
      )
    end

    rake_tasks do
      Dir[File.join(File.dirname(__FILE__), '../tasks/*.rake')].each do |f|
        load f
      end
    end
  end
end
