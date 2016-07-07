# Ascent
# A Higly customizable CMS for Programming
module Ascent
  def self.config(entity = nil, &block)
    if entity
      Ascent::Config.model(entity, &block)
    elsif block_given?
      block.call(Ascent::Config)
    else
      Ascent::Config
    end
  end
end
require 'ascent/config'
require 'ascent/engine'
