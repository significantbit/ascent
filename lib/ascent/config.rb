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
    DEFAULT_AUTHENTIONCATION = proc {}
    DEFAULT_CURRENT_USER = proc {}
    class << self
      # Application title
      attr_accessor :app_name

      # Parent Controller
      attr_accessor :parent_controller

      # Excluded blocks
      attr_accessor :excluded_blocks

      attr_accessor :configured_models

      attr_accessor :default_excluded_fields

      def authenticate_with(&block)
        @authenticate = block if block
        @authenticate || DEFAULT_AUTHENTIONCATION
      end

      def current_user_method(&block)
        @current_user = block if block
        @current_user || DEFAULT_CURRENT_USER
      end

      # Get all Blocks
      def blocks
        (included_blocks - excluded_blocks.map(&:to_s)).uniq.sort!
      end

      def model(entity, &block)
        key = entity.name.to_sym
        if block
          @configured_models[key] = Ascent::Config::Model.new(entity, &block)
        else
          @configured_models[key] ||= Ascent::Config::Model.new(entity)
        end
      end

      def lchomp(base, arg)
        base.to_s.reverse.chomp(arg.to_s.reverse).reverse
      end

      def included_blocks
        @system_models ||= # memoization for tests
          ([Rails.application]).flat_map do |app|
            (app.paths['app/models'].to_a).collect do |load_path|
              Dir.glob(app.root.join(load_path)).collect do |load_dir|
                Dir.glob(load_dir + '/**/*.rb').collect do |filename|
                  if File.read(filename).include?(Ascent::Mountable.to_s)
                    lchomp(filename, "#{app.root.join(load_dir)}/").chomp('.rb').camelize
                  end
                end
              end
            end
          end.flatten.compact
      end

      # Reset all configuration
      def reset
        @app_name = proc do
          chomp_text = ' Application'
          [Rails.application.engine_name.titleize.chomp(chomp_text), ' Ascent']
        end
        @excluded_blocks = []
        @parent_controller = '::ApplicationController'
        @default_excluded_fields = [:id, :updated_at, :created_at]
        @configured_models = {}
      end
    end


    reset
  end
end
