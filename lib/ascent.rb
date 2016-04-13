require 'ascent/config'
require 'ascent/engine'
# Ascent
# A Higly customizable CMS for Programming
module Ascent
  def self.config(&block)
    if block_given?
      block.call(Ascent::Config)
    else
      Ascent::Config
    end
  end
end
