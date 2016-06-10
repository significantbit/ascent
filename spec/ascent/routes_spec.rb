require 'spec_helper'

describe Ascent::Engine, type: :routing do
  routes { Ascent::Engine.routes }
end
