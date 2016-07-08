module Ascent
  module Config
    class Model
      def initialize(entity, &block)
        @entity = entity
        @block = block
        @excluded_fields = []
        @collection_scopes = {}
        instance_eval(&@block) if @block
      end

      def exclude(*args)
        fields = args.to_a.map(&:to_s)
        @excluded_fields = @excluded_fields.concat(fields).uniq
      end

      def excluded
        @excluded_fields.concat(Ascent.config.default_excluded_fields).map(&:to_s)
      end

      def collection_scope(key, block)
        @collection_scopes[key] = block
      end

      def collection(key, *args)
        scope = @collection_scopes[key.to_sym] ||= @entity.all
        scope.is_a?(Proc) ? scope.call(@entity, *args) : scope
      end
    end
  end
end
