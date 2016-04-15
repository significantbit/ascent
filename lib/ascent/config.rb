module Ascent
  # Configuration for Ascent
  # Can be set directly by calling Ascent::Config
  # @example Configure Ascent
  #   def setconfig
  #     Ascent::Config.app_name = "Cool Name"
  #   end
  #
  # Or by calling it with a block
  #
  # @example Configure Ascent with block
  #   Ascent::Config do |config|
  #     config.app_name = "Cooler name"
  #   end
  module Config
    class << self
      # Application title
      attr_accessor :app_name

      # Parent Controller
      attr_accessor :parent_controller

      # Excluded blocks
      attr_accessor :excluded_blocks

      # Get all Blocks
      def blocks
        b = ActiveRecord::Base.descendants.select do |c|
          c.included_modules.include?(Ascent::Mountable)
        end
        (b - excluded_blocks).uniq.sort
      end

      # Reset all configuration
      def reset
        @app_name = proc do
          chomp_text = ' Application'
          [Rails.application.engine_name.titleize.chomp(chomp_text), 'Ascent']
        end
        @excluded_blocks = []
        @parent_controller = '::ApplicationController'
      end
    end
    reset
  end
end
