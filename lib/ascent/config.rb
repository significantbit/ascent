module Ascent
  module Config
    class << self
      # Application title
      attr_accessor :app_name

      # Parent Controller 
      attr_accessor :parent_controller
      # Reset all configuration
      def reset
        @app_name = proc { [Rails.application.engine_name.titleize.chomp(' Application'), 'Ascent'] }
        @parent_controller = '::ApplicationController'
      end
    end
    reset
  end
end
