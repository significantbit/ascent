if defined?(::ActiveRecord)
  module ActiveRecord
    class Base
      def self.ascent(&block)
        Ascent.config(self, &block)
      end
    end
  end
end
