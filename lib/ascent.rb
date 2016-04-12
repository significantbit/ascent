require 'ascent/config'
require 'ascent/engine'

module Ascent
  def self.config(&block)
    if block_given?
      block.call(Ascent::Config)
    else
      Ascent::Config
    end
  end
end
