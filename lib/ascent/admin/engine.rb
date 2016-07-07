require 'ascent'
require 'sigbit_admin_rails'

module Ascent
  module Admin
    class Engine < Rails::Engine
      config.autoload_paths += Dir["#{config.root}/lib/**/"]
      isolate_namespace Ascent

      ActionView::Base.send :include, Ascent::ApplicationHelper
      ActionView::Base.send :include, Ascent::MainHelper

      rake_tasks do
        Dir[File.join(File.dirname(__FILE__), '../tasks/*.rake')].each do |f|
          load f
        end
      end
    end
  end
end
