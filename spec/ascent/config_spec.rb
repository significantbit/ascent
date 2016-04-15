require 'spec_helper'

describe Ascent::Config do
  # App name
  describe '.app_name' do
    it 'has a default value' do
      expect(Ascent.config.app_name.call).to eq(['Dummy App', 'Ascent'])
    end

    it 'can be changed' do
      Ascent.config do |config|
        config.app_name = 'Test Changed'
      end
      expect(Ascent.config.app_name).to eq('Test Changed')
    end
  end

  # Parent controller
  describe '.parent_controller' do
    it 'should default to application controller' do
      expect(Ascent.config.parent_controller).to eq('::ApplicationController')
    end

    it 'can be changed' do
      Ascent.config do |config|
        config.parent_controller = 'TestController'
      end
      expect(Ascent.config.parent_controller).to eq('TestController')
    end
  end

  # Blocks
  describe '.blocks' do
    before do
      # We do this to establish a connection to the TestBlock Model...
      # First test dont work, second does if not running this code
      # Must be a better way?
      build(:test_block)
    end

    it 'should include all models that are mountable' do
      expect(Ascent.config.blocks).to eq([TestBlock])
    end

    it 'should not include models that has been excluded' do
      Ascent.config.excluded_blocks = [TestBlock]
      expect(Ascent.config.blocks).to eq([])
    end
  end
end
