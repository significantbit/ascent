module Ascent
  module Config
    class Model
      def initialize(entity, &block)
        @entity = entity
        @block = block
        @excluded_fields = []
        instance_eval &@block if @block
      end

      def exclude(fields)
        if fields.kind_of?(Array)
          @excluded_fields = @excluded_fields.concat(fields).uniq
        else
          @excluded_fields.push(fields) unless @excluded_fields.include?(fields)
        end
      end

      def excluded
        @excluded_fields.concat(Ascent.config.default_excluded_fields).map(&:to_s)
      end
    end
  end
end
