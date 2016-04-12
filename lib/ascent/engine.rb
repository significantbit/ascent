module Ascent
  class Engine < Rails::Engine
    isolate_namespace Ascent

    rake_tasks do
      Dir[File.join(File.dirname(__FILE__), '../tasks/*.rake')].each {|f| load f }
    end
  end
end
