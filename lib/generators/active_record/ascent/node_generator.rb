require 'rails/generators/active_record'

module Ascent
  module Generators
    class NodeGenerator < ActiveRecord::Generators::Base
      desc 'create migration for ascent'
      def install

      end
    end
  end
end
