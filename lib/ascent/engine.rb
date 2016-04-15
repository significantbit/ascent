module Ascent
  # Ascent Engine
  class Engine < Rails::Engine
    isolate_namespace Ascent

    def reload_routes
      Rails.application.routes_reloader.reload!
    end

    rake_tasks do
      Dir[File.join(File.dirname(__FILE__), '../tasks/*.rake')].each do |f|
        load f
      end
    end
  end
end
